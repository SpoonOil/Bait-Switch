/// @description 
var currentFrame = floor(frame/framesPerPic)
var framesSinceLast = frame % framesPerPic
var opacity = framesSinceLast / framesToFade
if (opacity > 1) opacity = 1

if (currentFrame > 0) {
draw_sprite(sprCutscene, 0, x, y)
}

if (currentFrame > 1) {
draw_sprite(sprCutscene, 1, x, y)
}

if (frame == splashFrame) {
    audio_play_sound(sndGoFish, 100, false)
}

draw_sprite_ext(sprCutscene, currentFrame, x, y, 1, 1, 0, c_white, opacity)

