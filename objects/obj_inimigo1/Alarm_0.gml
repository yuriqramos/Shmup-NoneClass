///@description Dispara o tiro

// Checa se o inimigo está dentro da tela antes de atirar
/*
if(x < room_width && x > 0 && y > 0 && y < room_height)
{
	// Cria a instância do tiro
	instance_create_layer(x, y, "tiros", obj_inimigo1_tiro);
	
	// Toca o efeito sonoro
	efeito_som(sfx_laser2, .1);
}

// Toca o alarme novamente (em 1 seg)
alarm[0] = tempo_alarme * random_range(1, 2);
 * */