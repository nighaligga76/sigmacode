if (fade_dir == "out") {
    fade_alpha = min(fade_alpha + fade_speed, 1);
    if (fade_alpha >= 1) {
        if (target_room != -1) room_goto(target_room);
        fade_dir = "in"; // Switch to fade-in
    }
}
else if (fade_dir == "in") {
    fade_alpha = max(fade_alpha - fade_speed, 0);
    if (fade_alpha <= 0) instance_destroy();
}