/// @description 

switch (room) {
    case Dock:
        toggleMusic(sndDock)
        break;
    case Fishing:
        toggleMusic(sndDepth1)
        break;
    case Tutorial:
        toggleMusic(sndDepth1)
        break;
    case Fishing_2:
        toggleMusic(sndDepth2)
        break;
    case StarTutorial:
        toggleMusic(sndDepth2)
        break;
    case Fishing_3:
        toggleMusic(sndDepth3)
        break;
    case SpecialCaught:
        pauseAll();
        break;
}
function toggleMusic(sound) {
    for (var i = 0; i < array_length(songs); i++) {
        if (audio_is_playing(songs[i])) {
            audio_pause_sound(songs[i])
        }
    }
    
    if (audio_is_playing(sound)) {
        audio_resume_sound(sound)
    } else {
        audio_play_sound(sound, 10, true)
        array_push(songs, sound)
    }
}

function pauseAll() {
    for (var i = 0; i < array_length(songs); i++) {
        if (audio_is_playing(songs[i])) {
            audio_pause_sound(songs[i])
        }
    }
}

if (
    room == TheEnd || 
    room == CostumeShop || 
    room == CutsceneFishing ||
    room == UnlockRoom ||
    room == SpecialCaught
) {
    visible = false;
} else if (visible == false) {
    visible = true;
}