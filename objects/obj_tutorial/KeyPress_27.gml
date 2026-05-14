///@description Saindo da sala

// Mudando a sala de destino
global.destino = rm_inicio;

// Chamando a transição
criando_transicao(sq_transicao_abrindo);

// Avisando que está tendo transição
global.transicao = true;