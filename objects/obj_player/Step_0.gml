///@description Movimento e debug

//Controlando o jogador
controla_player();

// Mudando o tamanho do player para o normal
retorna_mola(.4);

// Ativando e desativando o debug
if(keyboard_check_released(vk_tab))
{
	// Inverte o valor atual do debug
	global.debug = !global.debug;
}

// Testa o uso da vida
if(keyboard_check_pressed(vk_enter))
{
	// Faz o jogador perder uma vida
	perde_vida();
}

// Diminui o efeito branco para tocar em só alguns frames
contador_efeito_branco();