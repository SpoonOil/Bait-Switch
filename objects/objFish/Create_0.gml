/// @description 
stuck = false;
stuckTo = undefined
canDash = true;

//pinning stars vars
baggedStars = [];
bagX = x
bagY = y

maxBagOffset = 10

bagOffset = 0


bagOffsetVelocity = 0.4

targetBagX = 0
targetBagY = 0
bagActive = true;

starAngles = []
hookActive = instance_number(objHook)


moving = function () {
    updateBagTarget()
    
    updateBagPosition()
    if (image_index >= 4) {
        image_index = 0
    }
    
    sprite_index = global.selectedSprite
    image_xscale = base_xscale
    
    if (point_distance(x, y, mouse_x,mouse_y) > 10) {
        direction = point_direction(x,y,mouse_x,mouse_y)
        speed = 15
    } 
        
    if (point_distance(x, y, mouse_x,mouse_y) < 50){
        speed -= 5
    }
    
    checkMolaCollision()
    
    
    if (
        objHook.state != objHook.aiming && 
        objHook.magnetLevel > 0 && 
        point_distance(x, y, objHook.x, objHook.y) < 150+objHook.magnetLevel*75
    ) {
        var adjustedMagnetLevel = objHook.magnetLevel
        if (global.beatGame && adjustedMagnetLevel > 2) {
            adjustedMagnetLevel = 2
        }
        x = x + lengthdir_x(5+adjustedMagnetLevel*1.7, point_direction(x, y, objHook.x, objHook.y))
        y = y + lengthdir_y(5+adjustedMagnetLevel*1.7, point_direction(x, y, objHook.x, objHook.y))
    }
    image_angle = direction
    
    return "dashing"
}

stunned = function () {
    speed = speed * (0.9)
    image_xscale = base_xscale
    if (speed <= 0.1 ) {
        speed = 0
        state = moving
    }
    var _rotSpeed = 20
    image_angle+=_rotSpeed
    
    return "stunned"
}

dashing = function() {
    image_index = 4
    image_xscale = 0.7
    if (sprite_index == sprMountedCost) {
        image_xscale = base_xscale
    }
    speed = speed*0.99
    speed-=3
    if (speed < 15) {
        speed = 3
        state = moving
    }
    checkMolaCollision()
    
    image_angle = direction
    
    return "dashing"
}


function checkMolaCollision() {
    if (checkFuturePosition(objMola)) {
        direction = point_direction(objMola.x, objMola.y, x, y)
        speed = 20
        
        global.molaBounces++;
        
        if (global.firstBounce) {
            global.firstBounce = false
            var _bounceBoom = instance_create_layer(x, y, "Booms", objBoom)
            _bounceBoom.sprite_index = sprBounceBoom
            audio_play_sound(sndBigBounce, 100, false)
        } else {
            audio_play_sound(sndBounce, 100, false)
        }
        state = stunned
    }
}
function resetStars(amount = 100) {
    
    var starstoKill = amount
    if (starstoKill = 1 && array_length(baggedStars) > 0) {
        array_pop(starAngles)
        var star = array_pop(baggedStars)
        star.x = bagX
        star.y = bagY
        star.state = star.shoot
        return
    }
    
    for (var i = 0; i < array_length(baggedStars); i++) {
        var star = baggedStars[i]
        if (starstoKill > 0) {
            starstoKill--
            star.x = bagX
            star.y = bagY
            star.state = star.scatter
            array_delete(baggedStars, i, 1)
            array_delete(starAngles, i, 1)
        }
    }
}

function getBagLevel() {
    var maxBagLevel = 7
    if (!global.spawnStarfish) {
        return 0
    }
    
    if (array_length(baggedStars) = 0) {
        return 1
    }
    var _threshhold = 1
    
    return min (maxBagLevel, floor(array_length(baggedStars)/_threshhold) + 1)
}

function updateBagTarget() {
    var _adjustedImageAngle = image_angle
    if (image_angle > 90 && image_angle < 270) {
        _adjustedImageAngle+= 90
    }
    targetBagX = x + lengthdir_x(70, 135+_adjustedImageAngle)
    targetBagY = y + lengthdir_y(70, 135+_adjustedImageAngle)
    
    bagOffset+=bagOffsetVelocity
    
    if (bagOffset > maxBagOffset || bagOffset < -maxBagOffset) {
        bagOffsetVelocity*=-1
    }
    
    targetBagY+=bagOffset
}

function updateBagPosition() {
    var _snapFactor = 5 // lower is stronger
    bagX = bagX + (targetBagX-bagX)/_snapFactor
    bagY = bagY + (targetBagY-bagY)/_snapFactor
}

function checkFuturePosition(object) {
    var _xspeed = lengthdir_x(speed, direction)
    var _yspeed = lengthdir_y(speed, direction)
    
    var _newX = x + _xspeed
    var _newY = y + _yspeed
    
    if (place_meeting(_newX, _newY, object)) {
        return true
    }
    return false
}

base_xscale = 0.5
image_xscale = 0.5
image_yscale = 0.5

state = moving
