/// @description Global Left Released

// Inherit the parent event
event_inherited();

if (!place_meeting(mouse_x, mouse_y, selected)) {
    selected.clearButtons()
}