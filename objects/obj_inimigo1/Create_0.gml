///@description Configurações iniciais

// Variável do tempo para tocar o alarme (1 seg)
tempo_alarme = game_get_speed(gamespeed_fps);

// Toca o alarme pela primeira vez (em 2 seg)
alarm[0] = tempo_alarme * 2;