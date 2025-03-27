/// @description 
image_angle = direction + 90

var inForceField = false

if (instance_number(objAnglerfish) > 0) {
    inForceField = (point_distance(x, y, objAnglerfish.x, objAnglerfish.y) < objAnglerfish.forcefieldRadius)
}

if (inForceField) {
    forceFieldRepulse()
}

if (speed = 0 || reeling) {
    direction = point_direction(targetX,targetY, x, y)
    
    if (objHook.state = objHook.reeling) {
        targetY = targetY+(lengthdir_x(objHook.vy, objHook.image_angle))
        targetX = targetX+ (lengthdir_y(objHook.vy, objHook.image_angle))
        speed = objHook.vy
        reeling = true
        if (point_distance(x, y, objHook.x, objHook.y) < 30) {
        with (all) {
            if (variable_instance_exists(self, "stuckTo") && stuckTo == other) {
                stuckTo = objHook
            }
        }
        instance_destroy()
        speed = 0
    }
    } else {
        y++;
    }
}
attachX = x + lengthdir_x(60, image_angle+90)
attachY = y + lengthdir_y(60, image_angle+90)
