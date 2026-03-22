///@description Configurações iniciais

// Método de destruição do inimigo
inimigo_morre = function()
{
	// Cria o efeito de explosão
	instance_create_layer(x, y, "efeitos", obj_inimigo_explosao);
	
	// Destrói o inimigo
	instance_destroy();
}

// Variável do tempo para tocar o alarme (1 seg)
tempo_alarme = game_get_speed(gamespeed_fps);

// Toca o alarme pela primeira vez (em 2 seg)
alarm[0] = tempo_alarme * 2;