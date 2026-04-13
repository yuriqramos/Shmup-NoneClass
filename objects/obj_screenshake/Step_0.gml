// Tremendo a tela

// Altera a posição X com base no valor de treme
if (treme > 0.1)
{
	// Valores que são escolhidos aleatoriamente e faz tremer a tela
	
	// Valor X
	var _treme_x = random_range(-treme, treme);
	// Valor Y
	var _treme_y = random_range(-treme, treme);
	
	// Altera a posição X do viewport
	view_set_xport(view_current, _treme_x);
	// Altera a posição Y do viewport
	view_set_xport(view_current, _treme_y);
	
}
else
{
	// Zera o valor de treme
	treme = 0;
}

// Parando de tremer aos poucos
treme = lerp(treme, 0, .1);