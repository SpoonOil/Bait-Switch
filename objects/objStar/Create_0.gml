/// @description Insert description here
// You can write your code in this editor 
baseScaling = 0.75
scaleVelocity = 0.00125
maxDiff= 0.05
scaling = baseScaling + (random_range(-maxDiff,maxDiff))
bias = random_range(-20, 20)

bobLevel = 0
bobVelocity = 0.025
maxBob = 0.5

bobLevel = random_range(-maxBob, maxBob)

spinning = false;

defaultAlarmSeconds = random_range(1.5*60, 15*60)
alarm[0] = defaultAlarmSeconds
image_speed = 0
image_xscale = scaling
image_yscale = scaling

image_index = floor(random_range(0, 8.9999))

none = function () {
    if (speed > 0.1) {
        speed = speed / 1.5
        keepInBounds()
    } else {
        speed = 0
    }
    
    bobLevel+=bobVelocity
    
    if (bobLevel >= maxBob || bobLevel <= -maxBob) {
        bobVelocity*=-1
    }
    
    y+= bobLevel
    //do nothing
    
    
    
    if (spinning) {
        updateSpin()
    }

    return "none"
}

bagged = function () {

    
    return "bagged"
}

scatter = function () {
    direction = random_range(0, 360) 
    speed = random_range(50, 180)
    
    state = none
    return "scatter"
}

function keepInBounds() {
    var _buffer = 50
    if (y < _buffer) {
        y+=speed
    } else if (y > room_height - _buffer) {
        y-= speed
    } else if (x < _buffer) {
        x += speed
    } else if (x > room_width -_buffer) {
        x -= speed
    }
}

state = none

function updateSpin() {
    var _spinSpeed = 3
    if (image_angle > 360 - _spinSpeed) {
        spinning = false   
        image_angle = 0
    } else {
        image_angle += _spinSpeed
    }
}
