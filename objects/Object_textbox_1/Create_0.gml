depth = -999999;

textbox_width = 200;
textbox_height =  80;
border = 8;
line_sep = 20;
line_width = textbox_width - border*2;  
line_height= textbox_height - border*2;  

textb_spr = Sprite_textbox_drawing;
textb_image = 0;
textb_image_speed = 6/60;

//text
page = 0;
page_number = 0;
text[0] = "";
text_length =[0] = string_length(text[0]);
draw_char = 0;
text_speed = 1;
//options

set_up = false;