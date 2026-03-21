///@description Checa o movimento e os tiros

//Controlando o jogador
controla_player();

// Ativando e desativando o debug
if(keyboard_check_released(vk_tab))
{
	// Inverte o valor atual do debug
	global.debug = !global.debug;
}

// Testa o uso da vida
if(keyboard_check_pressed(vk_enter))
{
	perde_vida();
}

// Testa o uso da vela
if(keyboard_check_pressed(ord("E")))
{
	usa_escudo();	
}

// Checa se o jogador tem um escudo, e faz ele seguir o jogador
if(instance_exists(meu_escudo))
{
	meu_escudo.x = x;
	meu_escudo.y = y;
}
// Senão, define o escudo como vazio
else
{
	meu_escudo = noone;
}