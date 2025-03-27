/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (position_meeting(mouse_x, mouse_y, self)) {
    timer++
}

if (timer >= maxTimer) {
    file_delete("saveData-00.dat")
    objTitleButton.sprite_index = sprPlay
    instance_destroy()
}