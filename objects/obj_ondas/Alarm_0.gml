///@description Alarme que cria as ondas

// Checa se a variável que conta as ondas já chegou no limite das sequências disponíveis
if (onda_atual >= array_length(ondas))
{
	// Reinicia a variávei para a primeira onda
	onda_atual = 0;
	
	// Criando a onda
	layer_sequence_create("sq_inimigos", 0, 0, ondas[onda_atual]);
}
else
{	
	// Criando a onda
	layer_sequence_create("sq_inimigos", 0, 0, ondas[onda_atual]);
	
	// Avança o contador da onda para a próxima
	onda_atual++;
}

// Toca o alarme de novo para criar a próxima onda
//alarm[0] = 600 // 10 segundos