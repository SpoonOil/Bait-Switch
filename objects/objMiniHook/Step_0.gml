/// @description 
image_angle = direction + 90

if (speed = 0 || reeling) {
    direction = point_direction(targetX,targetY, x, y)
    if (objHook.state() = "reeling") {
        targetY = objHook.y
        targetX = objHook.x
        speed = objHook.vy
        reeling = true
        if (distance_to_object(objHook) < 10) {
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
