
function scr_text_defaults_for_txt(){
    
    line_break_pos[0, page_number] =999;
    line_break_num[page_number] = 0;
    line_break_offset[page_number] = 0;
}

///paramm

function scr_text(_text){

    scr_text_defaults_for_txt();
    
    text[page_number] = _text;
    
    page_number++;
}
//param option
// param link id
function scr_option (_option, _link_id) {
 option[option_number] = _option;
    option_link_id[option_number] =_link_id;
    
    option_number++;
    
}

 function create_textbot(text_id) {
with( instance_create_depth(0, 0, -9999, Object_textbox) ) 
    {
    scr_game_text(text_id);
    
    }

}