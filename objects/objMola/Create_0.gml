/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

swimming = function () {
    hookAngle = point_direction(objHook.x, objHook.y, x, y)

    var avoidFactor = 0.005
    
    hookFactorX = (1000 - abs(x - objHook.x))/2000
    hookFactorY = (1000 - abs(y - objHook.y))/2000
    if (hookFactorX < 0) {
        hookFactorX = 0
    }
    
    if (hookFactorY < 0) {
        hookFactorY = 0
    }
    dx += lengthdir_x(spd, hookAngle) * avoidFactor * (hookFactorX)
    dy += lengthdir_y(spd, hookAngle) * avoidFactor * (hookFactorY)
    
    var marginAmount = 250
    var marginAvoidFactor = 0.05
    
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
    
    x+= dx * spd
    y+= dy * spd
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

image_xscale = scale
image_yscale = scale
spd = 10

dx = 0
dy = 0
