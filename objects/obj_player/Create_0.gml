///@description Sistema de movimentação do jogador

// Iniciando as ariávels

#region Variáveis

// Variável de velocidade do jogador
vel = 3;

// Variável de espera do tiro
espera_tiro = 9;

// Variável to timer do tiro
timer_tiro = 0;

#endregion

// Método de controle do jogador

#region Métodos

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
	var _velh = (_dire - _esqu) * vel;
	
	// Se movendo no X
	x += _velh;
	
	#endregion
	
	#region Movimentação vertical
	
	// Velocidade vertical
	var _velv = (_baixo - _cima) * vel;
	
	// Se movendo em Y
	y += _velv;
	
	#endregion
	
	#region Tiro do jogador
	
	// Diminuindo o timer do tiro
	timer_tiro--;
	
	// Criando o tiro quando aperta a tecla e se o timer estiver zerado
	if (_atirar && timer_tiro <= 0)
	{
		// Cria e salva a instância do tiro
		var _tiro = instance_create_layer(x, y, "tiro", obj_tiro_player);
		
		// Definindo o timer do tiro com o tempo de espera
		timer_tiro = espera_tiro;
	}
	
	#endregion
	
	#region Limites de tela
	
	// Limitando a nave no eixo X para dentro da tela
	x = clamp(x, sprite_width, room_width - (sprite_width / 2));
	
	// Limitando a nave no eixo Y para dentro da tela
	y = clamp(y, sprite_height / 2, room_height - (sprite_height / 2));
	
	#endregion
}

#endregion