function fadetoroom (new_room, fade_out_rt, fade_in_rt)
{
    var ins = instance_create_depth(0,0,-999, Object_fader)
    ins.room_to_transition = new_room;
    ins.fade_in = fade_out_rt;
    ins.fade_out = fade_out_rt;
}