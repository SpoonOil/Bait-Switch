/// @description Insert description here
// You can write your code in this editor
y += vy
var moveDist = scribble(" Game Loaded! ").starting_format("fontDisplay", c_white).get_height()
if (y - startingY >= moveDist && vy > 0) {
    vy = 0
    alarm[0] = 30
}

if (y < -moveDist) {
    instance_destroy()
}