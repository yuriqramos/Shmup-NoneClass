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

// Função que treme a tela
function tremendo_tela(_treme_tempo = 0)
{
	// Checa se a instância existe
	if (instance_exists(obj_screenshake))
	{
		// Checa se a tela já não está tremendo
		if (obj_screenshake.treme > 0.1)
		{
			// Sai da função
			return;
		}
		else
		{
			// Treme a tela, definincdo o valor no objeto
			obj_screenshake.treme = _treme_tempo;
		}
	}
}

#endregion