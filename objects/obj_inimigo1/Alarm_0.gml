///@description Dispara o tiro

// Cria a instância do tiro
instance_create_layer(x, y, "tiros", obj_inimigo1_tiro);

// Toca o alarme novamente (em 1 seg)
alarm[0] = tempo_alarme;