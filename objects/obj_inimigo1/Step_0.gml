///@description Checando o inimigo

// O movimento para quando o hitstop estiver ativo
if (global.hitstop) exit;

// Checa se o inimigo foi criado como uma sequência e se ele já saiu da sequência
if (!in_sequence && criado_em_sequencia)
{
	// Destrói o inimigo da sequência
	instance_destroy();
}

// Roda o módulo de timer do tiro
timer_atirando();