if place_meeting(x, y, Obj_player) && !instance_exists(object_warp)
{
   var inst = instance_create_depth(0, 0, -9999, object_warp);
    inst.target_x = target_x;
    inst.target_y = target_y;
    inst.target_rm = target_rm;
}