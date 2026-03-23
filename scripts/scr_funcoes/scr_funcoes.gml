#region Variáveis globais

// Variável que controla o debug
global.debug = false;

#endregion

#region Funções globais

// Função que cria o efeito de explosões e partículas
function sendo_destruido(_particula = obj_particulas)
{
	// Destrói o objeto
	instance_destroy();

	// Cria a instância das partículas
	instance_create_layer(x, y, "efeitos", _particula);
}
#endregion