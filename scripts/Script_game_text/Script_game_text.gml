
// paramete = text_id   
function scr_game_text (_text_id) {

    switch (_text_id) {
        case "npc 1":
            scr_text( "nigga what djhjdjhjd", "blue kid")
            scr_text( "skibnfjusljsksddjsdkdjkksdsdk nigga", "green kid", -1)
            scr_text("ywyyeyeyeyeye", "blue kid")
            scr_text("ok so>>", "green kid", -1)
        scr_option("maybe" , "npc 1 - ok");
        scr_option("nigha" , "npc 1 - fuk ya");
        break;
        
        case "npc 1 - ok":
            scr_text( "BETCH");
            break;
        
        case "npc 1 - fuk ya":
            scr_text( "this nigga"); 
           break;
        
        case "npc 2":
                   scr_text( "niter ")
            break;
           scr_text( "smegma ")
        case "npc 3":
                  scr_text( "nifer ") 
            break;
    }
    
}

