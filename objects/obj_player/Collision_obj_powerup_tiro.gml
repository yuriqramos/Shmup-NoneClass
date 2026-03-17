///@description Colisão com o powerup de tiro

// Destrói o powerup
instance_destroy(other);

// Roda a função de ganhar level do tiro
ganha_level_tiro();

// Cria o efeito de explosçaõ na posição do powerup
instance_create_layer(other.x, other.y, layer, obj_explosao);