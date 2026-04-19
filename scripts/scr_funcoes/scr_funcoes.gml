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

// Função que inicia as variáveis do efeito de mola
function inicia_efeito_mola()
{
	xscale = 1 // Eixo X
	yscale = 1 // Eixo Y
}

// Função que desenha o sprite para o efeito de mola
function desenha_efeito_mola()
{
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);
}

// Função que define os valores para o efeito de mola
function efeito_mola(_xscale = 1, _yscale = 1)
{
	xscale = _xscale;
	yscale = _yscale;
}

// Função que retorna o efeito de mola
function retorna_mola(_qtd = .1)
{
	xscale = lerp(xscale, 1, _qtd);
	yscale = lerp(yscale, 1, _qtd);
}

// Função que inicia o efeito branco
function inicia_efeito_branco()
{
	// Inicia a variável de dano
	tomei_dano = false;
}

// Função que define o tempo do efeito branco
function timer_efeito_branco(_tempo = 1)
{
	// Define o tempo de dano (em frames)
	tomei_dano = _tempo;
}

// Função que controla o contador do efeito branco
function contador_efeito_branco()
{
	// Diminui o efeito branco
	if (tomei_dano > 0) tomei_dano--;
}

// Função que desenha o efeito branco
function desenha_efeito_branco(_funcao_desenho = draw_self)
{
	// Checa se tomou dano
	if (tomei_dano)
	{
		// Desenha o efeito branco
		shader_set(sh_branco);
		
		// Define o efeito
		_funcao_desenho();
		
		// Reinicia o shader
		shader_reset();
	}
	else
	{
		// Apenas define o efeito
		_funcao_desenho();
	}
	
}

#endregion