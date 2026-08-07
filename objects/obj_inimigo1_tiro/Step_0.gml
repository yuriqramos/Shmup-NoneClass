///@description Checando a saída do tiro

// O movimento para quando o hitstop estiver ativo
if (global.hitstop) exit;

// SE o tiro sai totalmente da tela, ele é deletado
if(y >= room_height + 50) instance_destroy();
    
// Tiro se move com as velocidades definidas
x += velh;
y += velv;