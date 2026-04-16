///@description Movimento e debug

//Controlando o jogador
controla_player();

// Mudando o tamanho do player para o normal
xscale = lerp(xscale, 1, .3);
yscale = lerp(yscale, 1, .3);

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