//variaveis globais
global.pontos = 0;
global.best_score = 0;

//sistema de save para o best score
function salvar_jogo()
{
    var _struct =
    {
        best_score : global.best_score
    };
    
    //cria buffer
    var _buff = buffer_create(0, buffer_grow, 1);
    
    //converte a struct em uma string
    var _global = json_stringify(_struct);
    
    //adiciona a string no buffer
    buffer_write(_buff, buffer_string, _global);
    
    //salva o buffer
    buffer_save(_buff, "Best_score.json");
    
    //deleta o buffer
    buffer_delete(_buff);
}

//sistema de carregar jogo
function carregar_jogo()
{
    //se o arquivo n existe sai.
    if (!file_exists("Best_score.json")) return;
    
    //arquivo em um buffer
    var _new_buff = buffer_load("Best_score.json");
    
    //buffer em uma string
    var _string_struct = buffer_read(_new_buff, buffer_string);
    
    //string em stuct
    var _new_stuct = json_parse(_string_struct);
    
    //salvando na variavel
    global.best_score = _new_stuct.best_score;
    
    //deletando buff
    buffer_delete(_new_buff);
}




