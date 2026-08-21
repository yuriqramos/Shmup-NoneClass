/// DAMAGE FLASH

// Criando o damage flash
function damage_flash_ativa(_cor = c_white)
{
    // Cria o flash na tela
    var _flash = instance_create_depth(0, 0, 1, obj_damage_flash);
    
    // Tamanho do sprite de flash
    var _spr_w = _flash.sprite_width;
    var _spr_h = _flash.sprite_height;
    
    // Proporção da room em relação com a sprite
    var _prop_w = room_width / _spr_w;
    var _prop_h = room_height / _spr_h;
    
    // Tamanho do flash (multiplica tamanho da sprite * proporção
    _flash.image_xscale = _spr_w * _prop_w;
    _flash.image_yscale = _prop_h * _spr_h;
    
    // Define a cor do flash
    _flash.image_blend = _cor;
}