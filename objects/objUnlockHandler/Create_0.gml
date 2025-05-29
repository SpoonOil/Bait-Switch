// @description Insert description here
// You can write your code in this editor

image_speed = 0

activeUnlock = false;

function startUnlock(sprite, frame = 0) {
    //cant double unlock
    if (array_contains(global.finishedUnlocks, string(sprite) + string(frame))) {
        return
    }
    
    array_push(global.finishedUnlocks, string(sprite) + string(frame)) 
    activeUnlock = true;
    
    audio_play_sound(sndUnlock, 100, false)
    sprite_index = sprite;
    image_index = frame
    room_goto(UnlockRoom)
}

function endUnlock() {
    sprite_index = -1
    image_index = 0
    activeUnlock = false;
    room_goto(Dock)
}