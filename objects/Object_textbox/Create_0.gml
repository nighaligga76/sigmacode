depth = -999999;

textbox_width = 200;
textbox_height =  80;
border = 10;
line_sep = 20;
line_width = textbox_width - border*2;  
line_height= textbox_height - border*2;  

textb_spr[0] = Sprite_textbox_drawing;
textb_image = 0;
textb_image_speed = 6/60;

//text
page = 0;
page_number = 0;
text[0] = "";
text_length =[0] = string_length(text[0]);
char[0,0] = "";
char_x[0, 0]= 0;
char_y[0,0] = 0;
draw_char = 0;  
text_speed = 1;
//options
option[0] = "";
option_link_id [0] = -1;
option_pos = 0;
option_number = 0;

set_up = false;


//effects
scr_text_defaults_for_txt();
last_free_space_ = 0;