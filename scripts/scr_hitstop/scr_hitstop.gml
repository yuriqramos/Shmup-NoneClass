// HITSTOP

// Variável global do hitstop
global.hitstop = false;

// Função que ativa o hitstop (parametro tempo)
function hitstop_ativa(_tempo = 30)
{
    // Checa primeiro se o objeto existe no jogo
    var _existe = instance_exists(obj_hitstop_manager);
    
    // Se não existe, cria o objeto
    if(!_existe) instance_create_depth(0, 0, 0, obj_hitstop_manager);
        
    // Define o tempo do hitstop
    obj_hitstop_manager.timer_hitstop = _tempo;
    
    // Ativa o hitstop
    global.hitstop = true;
}