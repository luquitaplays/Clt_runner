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

movimento = function()
{
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