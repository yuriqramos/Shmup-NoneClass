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

// Função que encontra as camadas com background
function pega_backgrounds()
{
    // Pegando as camadas da room
    var _layers = layer_get_all();
    
    // Pegando o tamanho da lista de camadas
    var _qtd = array_length(_layers);
    
    // Array com todas as camadas
    var _bgs = [];
    
    // Loop FOR que checa o ID de fundo de cada camada
    for (var i = 0; i < _qtd; i++) 
    {
    	// Camada atual no loop
        var _atual = _layers[i];
        
        // ID do fundo da camada atual
        var _bg_id = layer_background_get_id(_atual);
        
        // Se a camada tiver um fundo válido
        if(_bg_id != -1)
        {
            // Pega o nome da lista
            var _nome = layer_get_name(_atual);
            
            // Empurra a camada para a lista
            array_push(_bgs, _nome);
        }
    }
    
    // Retorna o array de backgrounds
    return _bgs;
}