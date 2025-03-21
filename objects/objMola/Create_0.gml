/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

function attractObj(range, object, force) {
    if (distance_to_object(object) < range) {
            var hookAngle = point_direction(x, y, object.x, object.y)
            var avoidFactor = force
            
            dx += lengthdir_x(avoidFactor, hookAngle)
            dy += lengthdir_y(avoidFactor, hookAngle)
    }
}
swimming = function () {
    attractObj(200, objHook, -0.5)
    
    if (objFish.state != objFish.stunned || objFish.stuck == false) {
        attractObj(500, objFish, 0.25)
    } else {
        attractObj(500, objFish, -0.25)
    }
    
    var marginAmount = 250
    var marginAvoidFactor = 1
    
    if (y > room_height - marginAmount) {
        dy -= marginAvoidFactor
    } 
    if (x > room_width - marginAmount) {
        dx -= marginAvoidFactor
    }
    if (x < marginAmount) {
        dx += marginAvoidFactor
    }
    if (y < marginAmount) {
        dy += marginAvoidFactor
    }
    var angle = point_direction(x, y, x + dx, y + dy)
    
    image_angle = angle
    
    clampSpd()
    x+= dx
    y+= dy
}

hooked = function () {
    
}

state = swimming

function catchFish(hooker) {
    if (!stuck) {
        var _plus = instance_create_layer(x, y, "Booms", objBoom)
        _plus.image_index = 3
        stuck = true;
        stuckTo = hooker
        state = hooked
    }
}

scale = 0.75

minSpd = 1
maxSpd = 10

image_xscale = scale
image_yscale = scale
spd = 10

dx = 0
dy = 0

function clampSpd () {
    
    var rawSpd = dx * dx + dy * dy
    spd = sqrt(rawSpd)//pythag
    
    if (spd > maxSpd) {
        var clampFactor = maxSpd/spd
        
        dx *= clampFactor
        dy *= clampFactor
    }
}