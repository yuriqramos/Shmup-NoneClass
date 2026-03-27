///@description Checando o inimigo

// Checa se o inimigo foi criado como uma sequência e se ele já saiu da sequência
if (!in_sequence && criado_em_sequencia)
{
	// Destrói o inimigo da sequência
	instance_destroy();
}