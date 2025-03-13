up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(vk_space);

op_length = array_length(option[menu_level]);

pos+= down_key- up_key;
if pos >= op_length { pos = 0};
if pos < 0 { pos = op_length-1};
        
if accept_key {
    
    var _sml = menu_level;
            
switch (menu_level) {
    case 0: 
switch (pos) {
    

    case 0:
        var _fade = instance_create_layer(0, 0, "Instances", Object_fader);
                    _fade.target_room = Room_3; // Set target room
                    break;
    case 1:
        menu_level = 1; break;
    case 2:
        menu_level = 2; break;
    case 3:
        game_end(); break;
        
        
}
    break;
    
    case 1:
        switch (pos) {
            case 0: 
            break;
            
            case 1: 
            break;
            
            case 2:
                break;
            case 3:
                break;
            case 4:
                break;
            case 5:
                menu_level = 0;
            break;    
        }
        
        break;
    
    case 2:
        switch (pos) {
            case 0: 
            break;
            
            case 1: 
            break;
            
            case 2:
                break;
            case 3:
                menu_level = 0;
            break;    
        }
        
}
    
    if _sml != menu_level {pos = 0};
        
    op_length = array_length(option[menu_level]);
}