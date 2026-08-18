///@description Configurações

#region Variáveis

// Variável de vida do inimigo
vida = 10;

// Velocidade
vel = 1;
velv = 0;
velh = 0;

// Direção
dir = 0;

// Variável de estado
estado = "chegando"

// variável de tempo do carregamento (2 segundos)
tempo_carregando = game_get_speed(gamespeed_fps) * 2;

// Variável de timer do carregamento
timer_carregando = 0

// Variável de contador de tiro
contador_tiros = 0;

// Variável com o limite de tiros para fugir
fugindo_limite = 5;

// Variável de decisão de direção
decidi_direcao = false;

// Inicia o efeito mola
inicia_efeito_mola();

// Inicia o efeito mola
inicia_efeito_branco();

#endregion

#region Máquina de estado

maquina_de_estado = function()
{
	// Switch que checa o valor
	switch(estado)
	{
		// Caso onde ele está chegando na tela
		case "chegando":
		{
			// Se ele não estiver na posição
			if(y < 160)
			{
				// Ele vai descendo pela tela
				velv = vel;
			}
			else
			{
				// Muda para o estado de carregando
				estado = "carregando";
			}
		}
		// Acabei o case, ele tem que parar
		break;
		
		// Caso onde o inimigo carrega o tiro
		case "carregando":
        {
			// Para a nave
			velv = 0;
            
			// Aumenta o timer
			timer_carregando++;
			
			// Checa se o inimigo já deu a quantidade de tiros para fugir
			if (contador_tiros <= fugindo_limite)
			{
				// Se o timer chegar ao tempo estimado
				if(timer_carregando >= tempo_carregando)
				{
					// Muda de estado para atirando
					estado = choose("atirando1", "atirando2");
				
					//Resetando o timer
					timer_carregando = 0;
					
					// Aumenta o contador de tiros
					contador_tiros++;
				}
            }
			else
			{
				// Muda o estado para fugindo
				estado = "fugindo";
                
                // Definindo a direção de forma aleatória
                dir = irandom(359);
			}
		} 
        break;
		
		// Caso onde o inimigo atira o tiro 1
		case "atirando1":
		{
			// Checa se o player existe antes de atirar
			if (instance_exists(obj_player))
			{
				// Direção do tiro
				var _dir = point_direction(x, y, obj_player.x, obj_player.y);
                
                // Criando a instância do tiro
                var _tiro = instance_create_layer(x, y, "tiros", obj_inimigo3_tiro1);
                
                // Velocidade do tiro
                var _vel = 5;
			
                // Variáveis de velocidade nos eixos
				var _velh = lengthdir_x(_vel, _dir);
                var _velv = lengthdir_y(_vel, _dir);
                
                // Definindo o tiro
                _tiro.velh = _velh;
                _tiro.velv = _velv;
                 
				// Definindo a direção do tiro
				_tiro.direction = _dir;
				
				// Ângulo da imagem do tiro
				_tiro.image_angle = _dir + 90;
				
				// Toca o efeito sonoro
				efeito_som(sfx_laser2, .1);
            }
            
			// Mudando o estado para carregando
			estado = "carregando";
        }
            
		break;
		
		// Caso onde o inimigo cria o tiro 2
		case "atirando2":
		{
			// Variável do ângulo dos tiros
			var _tiro_ang = 255;
			
			// Toca o efeito sonoro
			efeito_som(sfx_laser2, .1);
			
			// Repetindo a criação do tiro
			repeat(3)
			{
				// Criando o tiro 2
				var _tiro = instance_create_layer(x, y, "tiros", obj_inimigo3_tiro2);
                
                // Velocidade do tiro
				var _vel = _tiro.vel;
                
                // Direção do tino nos doie eixos
                var _velh = lengthdir_x(_vel, _tiro_ang);
                var _velv = lengthdir_y(_vel, _tiro_ang);
                
                // Definindo a direção no tiro
                _tiro.velh = _velh;
                _tiro.velv = _velv;
                
				// Aumenta o ângulo para o próximo tiro
				_tiro_ang += 15;
			}
            
			// Volta para o estado de carregando
			estado = "carregando";
		}
            
		break;
		
		// Caso onde o inimigo foge
		case "fugindo":
		{
			
			// Checando se já decidiu a direção
			if (decidi_direcao = false)
			{
				// Escolhe uma direção para fugir
				velh = lengthdir_x(vel, dir);
                velv = lengthdir_y(vel, dir);
				
				// Define a variável de decisão
				decidi_direcao = true;
			}
			
			// Checa se o inimigo saiu da tela, e destroi ele se saiu
			if (y < - 100 or y > room_height + 100 or x < -100 or x > room_width + 100) instance_destroy();
		}
		
		break;
	}
	
}

#endregion

#region Função de morte

morrendo = function ()
{
	// Perdendo vida
	vida--;
	
	// Tremendo tela
	tremendo_tela(5);
    
    // Hitstop
    hitstop_ativa(5);
	
	// Efeito mola
	efeito_mola(1.5, .5);
	
	// Efeito branco
	timer_efeito_branco(5);
	
	// SE não tiver mais vida
	if(vida <= 0)
	{
		// Destruindo o inimigo
		sendo_destruido(obj_inimigo_explosao);
		
		// Treme a tela
		tremendo_tela(10);
		
		//Efeito sonoro
		efeito_som(sfx_explosion, 0.1);
	}
}

#endregion