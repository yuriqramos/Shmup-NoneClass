///@description Sistema de movimentação do jogador

// Iniciando as ariávels

#region Variáveis

// Variável de velocidade
vel = 3;

#endregion

// Método de controle do jogador

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
	_atirar = keyboard_check_pressed(vk_space) or mouse_check_button_pressed(mb_left);
	
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
	
	// Criando o tiro quando aperta a tecla
	if (_atirar)
	{
		// Cria a instância do tiro na camada necessária
		instance_create_layer(x, y, "tiro", obj_tiro);
	}
	
	#endregion
}