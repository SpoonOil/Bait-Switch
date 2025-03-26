/// @description Insert description here
// You can write your code in this editor/

if (state == none) {
    state = bagged
    x = -1000
    array_push(objFish.baggedStars, self)
    //var sounds = 
    audio_play_sound(sndGulp, 100, false, 1, 0, choose(1, 0.75, 1.25, 1.1, 0.9))
}