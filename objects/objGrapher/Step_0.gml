/// @description 

if (keyboard_check(vk_escape)) {
    room_goto(Dock)
}
if (keyboard_check(vk_right)) {
    x-=5;
}

if (keyboard_check(vk_left)) {
    x+=5;
}