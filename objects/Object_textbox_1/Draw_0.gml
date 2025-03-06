accept_key =keyboard_check_pressed(vk_space);

textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]) + 126;

//set up
if set_up == false{
    
    set_up = true;
    draw_set_font(global.font_main);
    draw_set_valign(fa_top);
    draw_set_valign(fa_left);
    

   // loop to pages


for (var p = 0; p < page_number; p++) 
{
    //how many same charactsare in each page and store that number in text_length array nigha
   text_length[p] = string_length(text[0]);
    //get the x position for the textbox
     // if no character [center the textbox]
    text_x_offset[p] = 44;
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
          instance_destroy();  
        }
    }
        // if not done typing 
    else {
        
        
        draw_char = text_length[page];
    }
    
}

// draw textbox
textb_image += textb_image_speed;
textb_spr_w = sprite_get_width(textb_spr);
textb_spr_h = sprite_get_height(textb_spr);
//back of textbox

draw_sprite_ext(textb_spr, textb_image, textbox_x + text_x_offset[page], textbox_y, textbox_width/textb_spr_w, textbox_height/textb_spr_h, 0, c_white, 1);

//draw the text
var _drawset = string_copy(text[page], 1, draw_char);
draw_text_ext( textbox_x + text_x_offset[page] + border, textbox_y + border, _drawset, line_sep, line_width);