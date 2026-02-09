//variaveis
sentido = 1;

chao = false;

right = 0;
left = 0;

velh = 0;

pega_imput = function()
{
    right = keyboard_check_pressed(vk_right);
    left = keyboard_check_pressed(vk_left);
}

aciocia_velocidade = function()
{
    move_and_collide(velh, 0, obj_chao);
}

checa_chao = function()
{
    chao = place_meeting(x + sentido, y, obj_chao);
}

pegar_coisas = function()
{
    var _ifood = instance_place(x, y, obj_ifood);
    if (_ifood != noone)
    {
        instance_destroy(_ifood);
        global.pontos++;
    }
    
    var _clt = instance_place(x, y, obj_clt);
    if (_clt != noone)
    {
        if (!instance_exists(obj_UL))
        {
            instance_create_layer(room_width / 2, room_height / 2, "game", obj_UL);
            image_speed = 0;
            image_index = 4;
            var lay_id = layer_get_id("Background");
            layer_vspeed(lay_id, 0);
        }
    }
}

movimento = function()
{
    if (instance_exists(obj_UL)) return;
    
    if (chao)
    {
        velh = 0;
        image_xscale = sentido;
        
        //se agente muda a dir
        if (right != left)
        { 
            sentido = right - left;
            velh = 5 * sentido;
        }
    }
    else 
    {
        image_xscale = lerp(image_xscale, sentido, 0.1);
    }
}

atualisa_score = function()
{
    if (global.pontos > global.best_score)
    {
        global.best_score = global.pontos;
    }
}