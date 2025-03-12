/// @description 

// Inherit the parent event
event_inherited();

audio_play_sound(sndGoFish, 10, false)

if (global.tutorial1) {
    global.tutorial1 = false;
    room_goto(Tutorial)
    exit
}

if (global.line == 1 && global.tutorial2) {
    global.tutorial2 = false;
    room_goto(StarTutorial)
    exit
}

switch (global.line) {
    case 0:
        room_goto(Fishing)
    break;
    case 1:
        room_goto(Fishing_2)
    break;
    case 2: 
        room_goto(Fishing_3)
    break;
    default: 
        room_goto(Fishing_3)
    break;
}
