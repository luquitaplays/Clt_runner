//randomisando tudo
randomize();

//criando comida ou clt
var _chance = irandom(9);
var _random_i = irandom(array_length(comidas) - 1);
var _clt_porcento = 3 + global.pontos/20;
var _tempo_min = 60 - global.pontos/2;
var _tempo_max = 75 - global.pontos/2;

//garantindo que n vai ser 0
if (_tempo_min <= 0) _tempo_min = 1;
if (_tempo_max <= 0) _tempo_max = 1;

//chaces de criar clt
if (_chance < _clt_porcento)
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

if (instance_exists(obj_UL)) return;

//chamando alarm
randomize();
alarm[0] = irandom_range(_tempo_min, _tempo_max);