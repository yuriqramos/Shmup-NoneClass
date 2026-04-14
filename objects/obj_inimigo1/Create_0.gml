///@description Configurações iniciais

// Variável do tempo para tocar o alarme (1 seg)
tempo_alarme = game_get_speed(gamespeed_fps);

// Descobrindo se eu fui criado em uma sequência
criado_em_sequencia = in_sequence;

// Método de morte e criação do powerup
morrendo = function()
{
	// Cria a explosão do jogador
	sendo_destruido(obj_inimigo_explosao);
	
	// Treme a tela
	tremendo_tela(5);
	
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