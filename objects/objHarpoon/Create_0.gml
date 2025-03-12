/// @description 

debug = false;

preFire = function () {
    x = objHook.x
    y = objHook.y-60
    direction = point_direction(x, y, objFish.x, objFish.y)
    image_angle = direction
    
    return "preFire";
}

firing = function () {
    speed= speed*0.92-1;
    if (speed <=0) {
        speed = 0;
        state = finished;
    }
    
    return "firing"
}

cocking = function () {
    speed = -5
    
    return "cocking"
}

finished = function () {
    speed = 0
    y+=1;
    if (objHook.y < room_height/2) {
        state = reeling
    }
    
    return "finished"
}

reeling = function () {
    direction = point_direction(x, y, objHook.x, objHook.y-60)
    var _targetAngle = direction+180
    
    image_angle = (_targetAngle + image_angle) / 2
    speed = 25
    
    if (distance_to_object(objHook) < 20) {
        x = objHook.x
        y = objHook.y
        speed = 0
    }
    return "reeling"
}

state = preFire

image_xscale = 0.2
image_yscale = 0.2
