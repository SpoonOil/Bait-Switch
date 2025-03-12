/// @description 
image_speed = 0;

if (global.portalUnlock) {
    image_index = 0
} else if (global.magnetUnlock) {
    image_index = 1
} else if (global.harpoonUnlock) {
    image_index = 2
} else if (global.scatterUnlock) {
    image_index = 3
}

audio_play_sound(sndUnlock, 10, false)