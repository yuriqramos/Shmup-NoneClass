///@description Rodando constantemente

// O movimento para quando o hitstop estiver ativo
if (global.hitstop) exit;

// Rodando a máquina de estado
maquina_de_estado();

// Retorna a nave para a posição original
retorna_mola(.3);

// Conta o tempo do efeito branco
contador_efeito_branco();

x += velh;
y += velv;