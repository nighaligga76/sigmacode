accept_key = keyboard_check_pressed(vk_space);

textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]) + 126;

//set up
if set_up == false{
    
    set_up = true;
    draw_set_font(Font1);
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
    

   // loop to pages

page_number = array_length(text);
for (var p = 0; p < page_number; p++) 
{
    //how many same charactsare in each page and store that number in text_length array nigha
   text_length[p] = string_length(text[0]);
    
    
    //get the x position for the textbox
    //charac on da lef
    text_x_offset[p] = 86;
    portrait_x_offset[p] = 8;
    
    //charac on da right
    if speaker_side[p] == -1 {
     text_x_offset[p] = 8;
        portrait_x_offset = 216;   
    }
    
     // if no character [center the textbox]
    if speaker_sprite[p] == noone {
    text_x_offset[p] = 44;
        
    }
    
    //setting indiv chars and finding where the lines should break
    for (var c = 0; c < text_length[p]; c++)
    {
            var _char_pos = c+1;
        
        //store indiv char in "char" array
        char[c, p] = string_char_at(text[p], _char_pos);
        
        
        //get current width of line
        var _txt_up_to_char = string_copy(text[p], 1, _char_pos);
        var _current_text_w =string_width( _txt_up_to_char) - string_width(char[c, p]);
        
        
        //get last free space      
        if char[c,p] == " " { last_free_space = _char_pos+1 } ;
            
        //get line breaks
        if _current_text_w - line_break_offset[p] > line_width
        {
            
            line_break_pos[line_break_num[p], p] = last_free_space;
            line_break_num[p]++;
            var _txt_up_to_last_space = string_copy(text[p], 1, last_free_space);
            var _last_free_space_string = string_char_at(text[p], last_free_space);
            line_break_offset[p] = string_width(_txt_up_to_last_space) - string_width(_last_free_space_string);
            
        }
    
    }
    
    
    
    //getting each chars  coordinates
    for (var c = 0; c < text_length[p]; c++) 
        
        {
        var _char_pos = c+1;
        var _text_x = textbox_x + text_x_offset[p] + border;
        var _text_y =  textbox_y + border ;
        
        //get current width of line
        var _txt_up_to_char = string_copy(text[p], 1, _char_pos);
         var _current_text_w =string_width(_txt_up_to_char  ) - string_width(char[c, p]);
        var _text_line = 0;
        
        //compensate for line breaks
        
        for (var lb = 0; lb < line_break_num[p]; lb++)
        {
            //if the cureent looping char is after a line break
            if _char_pos >= line_break_pos[lb, p]
            {
                
                var _str_copy = string_copy(text[p], line_break_pos[lb, p], _char_pos - line_break_pos[lb, p]);
                _current_text_w = string_width(_str_copy);
                
                //record the 'line' this char should be on
                
                _text_line = lb+1; // +1 since 1b starts at 0
            }
        }
        
        //add x and y coordinates base of new info
        char_x[c, p] = _text_x + _current_text_w;
        char_y[c, p] = _text_y + _text_line*line_sep;
    }
    
}
}

//typing the text
if draw_char < text_length[page]{
    
    
    draw_char += text_speed;
    draw_char =clamp(draw_char, 0, text_length[page]) ;
}


// flip through pages
if accept_key
{

       //typing is done
    if draw_char == text_length[page]
    {
        //next page 
        if page < page_number-1
        {
            page++
            draw_char =0;
        }
        // destroy textbox
        else {
            //link text for options
            if option_number > 0 {
                create_textbot(option_link_id[option_pos]);
            }
            
          instance_destroy();  
        }
    }
        // if not done typing 
    else {
        
        
        draw_char = text_length[page];
    }
    
}


// draw textbox
var _textb_x = textbox_x + text_x_offset[page];
var _textb_y = textbox_y;
textb_image += textb_image_speed;
textb_spr_w = sprite_get_width(textb_spr[page]);
textb_spr_h = sprite_get_height(textb_spr[page]);
//draw speaker
if speaker_sprite[page] != noone{
    
    sprite_index = speaker_sprite[page];
    var _speaker_x = textbox_x + portrait_x_offset[page];
    if speaker_side[page] == -1  {_speaker_x += sprite_width};
        //draw the speaker
    draw_sprite_ext(textb_spr[page], textb_image, textbox_x + portrait_x_offset[page], textbox_y, sprite_width/textb_spr_w, sprite_height/textb_spr_h, 0, c_white, 1); 
        draw_sprite_ext(sprite_index, image_index, _speaker_x, textbox_y, speaker_side[page], 1, 0, c_white, 1);
    
        }


//back of textbox

draw_sprite_ext(textb_spr[page], textb_image, textbox_x + text_x_offset[page], textbox_y, textbox_width/textb_spr_w, textbox_height/textb_spr_h, 0, c_white, 1);


// OPTIONS
if draw_char == text_length[page] && page == page_number -1 {
    
    
    //option slection
    option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
    option_pos = clamp(option_pos, 0, option_number-1);
    
    // draw options
    var _op_space = 20;
    var _op_border = 10;
    for (var op = 0; op < option_number; op++){
        //option boxx
        var _o_w = string_width(option[op]) + _op_border*2;
        draw_sprite_ext(textb_spr[page], textb_image, _textb_x + 18, _textb_y - _op_space*option_number + _op_space*op, _o_w/textb_spr_w, (_op_space-1)/textb_spr_h, 0, c_white, 1);

        //arrow
        if option_pos == op{
            
            draw_sprite(Sprite_arrow, 0, _textb_x,  _textb_y - _op_space*option_number + _op_space*op);
        }
        
        
        //option text
        draw_text(_textb_x + 18 + _op_border, _textb_y - _op_space*option_number + _op_space*op + 2, option[op]);        
    }
}



//draw the text
for(var c = 0; c < draw_char; c++){
    //text 
    draw_text(char_x[c, page], char_y[c, page], char[c, page]);
}