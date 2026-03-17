///@description Checa o movimento e os tiros

//Controlando o jogador
controla_player();

// Ativando e desativando o debug
if(keyboard_check_released(vk_tab))
{
	// Inverte o valor atual do debug
	global.debug = !global.debug;
}

if(keyboard_check_pressed(vk_enter))
{
	perde_vida();
}

if(keyboard_check_pressed(ord("E"))){
	usa_escudo();	
}