/// @description 

debug = false;

originX = 0
originY = 0

range = 500

if (global.difficulty == 0) {
    range = 600
}

preFire = function () {
    x = objHook.x + lengthdir_x(60, objHook.image_angle+90)
    y = objHook.y + lengthdir_y(60, objHook.image_angle+90)
    direction = point_direction(x, y, objFish.x, objFish.y)
    image_angle = direction
    
    return "preFire";
}

firing = function () {
    var distanceFromStart = point_distance(originX, originY, x, y)
    var distanceToMax = range - distanceFromStart
    
    if (distanceToMax <= 30) {
        speed = speed*0.8-0.1
    }
    
    if (speed <= 0) {
        speed = 0;
        state = finished
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
    if (objHook.getSinkStage() < 2) {
        state = reeling
    }
    
    return "finished"
}

reeling = function () {
    direction = point_direction(x, y, objHook.x, objHook.y-60)
    var _targetAngle = objHook.image_angle + 90
    var turnSpeed = 2
    
    if (angle_difference(image_angle, _targetAngle) > 0) {
        image_angle+=turnSpeed
    } else if (angle_difference(image_angle, _targetAngle) < 0) {
        image_angle-=turnSpeed
    }
    if (speed < 25) {
        speed = 25
    } else {
        speed+=0.1
    }
    
    if (distance_to_object(objHook) < 10) {
        with (all) {
            if (variable_instance_exists(self, "stuckTo") && stuckTo == other) {
                stuckTo = objHook
            }
        }
        instance_destroy()
        speed = 0
    }
    return "reeling"
}

state = preFire

image_xscale = 0.2
image_yscale = 0.2
