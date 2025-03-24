/// @description

var _currentSound = sndDash3

if (canDash) {
    audio_play_sound(_currentSound, 10, false)
    objParticleManager.createDashParticles(x, y, image_angle)
    speed = 53 
    direction = image_angle
    resetStars(1)
    state = dashing
    global.dashes++
    canDash = false;
    alarm[0] = 12
}