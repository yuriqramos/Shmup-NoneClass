///@description Sistema de movimentação do jogador

// Iniciando as ariávels

#region Variáveis

// Velocidade do jogador
vel_jogador = 3;

// Velocidade dos tiros
vel_tiros = -10

// Espera dos tiros
espera_tiro = 9;

// Ttimer dos tiros
timer_tiro = 0;

// Level do meu tiro
level_tiro = 1;

#endregion

// Método de controle do jogador

#region Métodos

	#region Controles do jogador
	
	controla_player = function()
	{
		#region Definindo as teclas
	
		// Pegando as teclas
		var _cima, _baixo, _esqu, _dire, _atirar;
	
		// Indo para cima (tecla W ou Cima)
		_cima = keyboard_check(ord("W")) or keyboard_check(vk_up);
	
		// Indo para baixo (tecla S ou Baixo)
		_baixo = keyboard_check(ord("S")) or keyboard_check(vk_down);
	
		// Indo para esquerda (tecla A ou Esquerda)
		_esqu = keyboard_check(ord("A")) or keyboard_check(vk_left);
	
		// Indo para a direita (tecla D ou Direita)
		_dire = keyboard_check(ord("D")) or keyboard_check(vk_right);
	
		// Atirando (tecla Espaço ou botão esquerdo do mouse)
		_atirar = keyboard_check(vk_space) or mouse_check_button(mb_left);
	
		#endregion
	
		#region Movimentação horizontal
	
		// Velocidade horizontal
		var _velh = (_dire - _esqu) * vel_jogador;
	
		// Se movendo no X
		x += _velh;
	
		#endregion
	
		#region Movimentação vertical
	
		// Velocidade vertical
		var _velv = (_baixo - _cima) * vel_jogador;
	
		// Se movendo em Y
		y += _velv;
	
		#endregion
	
		#region Tiros do jogador
	
		// Diminuindo o timer dos tiros
		timer_tiro--;
	
		// Criando o tiro quando aperta a tecla e se o timer estiver zerado
		if (_atirar && timer_tiro <= 0)
		{	
			// Checando o nível do tiro
			if(level_tiro == 1)
			{
				// Criando o tiro no meio
				tiro_meio();
			}
			else if(level_tiro == 2)
			{
				// Criando o tiro nos lados
				tiros_lados();
			}
			else if(level_tiro == 3)
			{
				// Criando os 3 tiros
				tiros_maximo();
			}
		
			// Definindo o timer dos tiros com o tempo de espera
			timer_tiro = espera_tiro;
		}
	
		#endregion
	
		#region Limites de tela
	
		// Limitando a nave no eixo X para dentro da tela
		x = clamp(x, sprite_width / 2, room_width - (sprite_width / 2));
	
		// Limitando a nave no eixo Y para dentro da tela
		y = clamp(y, sprite_height / 2, room_height - (sprite_height / 2));
	
		#endregion
	}
	
	#endregion

	#region Criando os tiros
	
	tiro_meio = function()
	{
		// Criando o tiro no meio da nave
		var _tiro = instance_create_layer(x, y - 3, "tiros", obj_tiro_player);
		
		// Definindo a velocidade
		_tiro.vspeed = vel_tiros;
	}
	
	tiros_lados = function()
	{
		// Criando o tiro no lado esquerdo
		var _tiro_esqu = instance_create_layer(x - 7, y, "tiros", obj_tiro_player);
		
		// Definindo a velocidade do tiro da esquerda
		_tiro_esqu.vspeed = vel_tiros;
		
		// Criando o tiro no lado direito
		var _tiro_dire = instance_create_layer(x + 7, y, "tiros", obj_tiro_player);
		
		// Definindo a velocidade do tiro da esquerda
		_tiro_dire.vspeed = vel_tiros;
	}
	
	tiros_maximo = function()
	{
		// Criando o tiro do meio
		tiro_meio();
		
		// Criando os tiros do lado
		tiros_lados();
	}
	
	ganha_level_tiro = function()
	{
		// Checa se já está no level máximo
		if(level_tiro >= 3)
		{
			// Limita o level máximo
			level_tiro = 3;
		}
		else
		{
			// Aumenta o level
			level_tiro++;
		}
	}
	
	#endregion

#endregion