/// @description 

// Inherit the parent event
event_inherited();

if (objController.goCutscene) {
    objController.goCutscene = false;
    room_goto(CutsceneFishing)
    exit
}

audio_play_sound(sndGoFish, 10, false)

goToCurrentDepth()