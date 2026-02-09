//randomisando tudo
randomize();

//criando comida ou clt
var _chance = irandom(9);
var _random_i = irandom(array_length(comidas) - 1);

if (_chance < 3)
{
    var _x = choose(-4, 184);
    var _clt = instance_create_layer(_x, -16, "Criacoes", obj_clt);
    if (_x == -4) _clt.image_xscale = -1;
}
else 
{
    var _x = choose(12, 164);
    var _ifood = instance_create_layer(_x, -16, "Criacoes", comidas[_random_i]);
    if (_x == 12) _ifood.image_xscale = -1;
}


//chamando alarm
randomize();
alarm[0] = irandom_range(60, 75);