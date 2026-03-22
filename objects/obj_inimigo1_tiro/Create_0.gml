///@description Configurações iniciais

// Função de morte do jogador
morrendo = function()
{
	// Criando a partícula do tiro
	instance_create_layer(x, y + 10, "efeitos", obj_particulas);
	
	// Se destruindo
	instance_destroy();
}
// Velocidade do tiro (vai para baixo no eixo Y)
vspeed = 5;