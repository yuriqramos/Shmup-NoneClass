///@description Configurações iniciais

// Variável do tempo para tocar o alarme (1 seg)
tempo_alarme = game_get_speed(gamespeed_fps);

// Método de morte e criação do powerup
morrendo = function()
{
	// Cria a explosão do jogador
	sendo_destruido(obj_inimigo_explosao);
	
	// Variável de chance de criar o powerup
	var _chance = random(100);
	
	// Cria o powerup se caso o jogador tiver a chance (10%¨de chance)
	if(_chance > 90)
	{
		// Cria o powerup
		instance_create_layer(x, y, "powerups", obj_powerup_tiro);
	}
}

// Toca o alarme pela primeira vez (em 2 seg)
alarm[0] = tempo_alarme * 2;