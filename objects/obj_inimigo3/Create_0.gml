///@description Configurações

#region Variáveis

// Variável de vida do inimigo
vida = 10;

// Variável de estado
estado = "chegando"

// variável de tempo do carregamento (2 segundos)
tempo_carregando = game_get_speed(gamespeed_fps) * 2;

// Variável de timer do carregamento
timer_carregando = 0

// Variável de contador de tiro
contador_tiros = 0;

// Variável com o limite de tiros para fugir
fugindo_limite = 3;

// Variável de decisão de direção
decidi_direcao = false;

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
				vspeed = 1.2;
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
			vspeed = 0;
			
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
			
				// Criando o tiro 1
				var _tiro = instance_create_layer(x, y, "tiros", obj_inimigo3_tiro1);
			
				// Definindo a velocidade do tiro
				_tiro.speed = 2;
			
				// Definindo a direção do tiro
				_tiro.direction = _dir;
				
				// Ângulo da imagem do tiro
				_tiro.image_angle = _dir + 90;
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
			
			// Repetindo a criação do tiro
			repeat(3)
			{
				// Criando o tiro 2
				var _tiro = instance_create_layer(x, y, "tiros", obj_inimigo3_tiro2);
			
				// Velcidade do tiro
				_tiro.speed = 4;
			
				// Direção do tiro 
				_tiro.direction = _tiro_ang;
				
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
				hspeed = choose(-1, 1);
				
				// Define a variável de decisão
				decidi_direcao = true;
			}
			
			// Vai para cima para fugir
			vspeed = -2;
			
			// Checa se o inimigo saiu da tela, e destroi ele se saiu
			if (y < - 50) instance_destroy();
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
	
	// SE não tiver mais vida
	if(vida <= 0)
	{
		// Destruindo o inimigo
		sendo_destruido(obj_inimigo_explosao);
		
		// Treme a tela
		tremendo_tela(10);
	}
}

#endregion