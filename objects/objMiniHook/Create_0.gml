/// @description 

speed = 20

targetX = x
targetY = y
lineLength = 300

attachX = x + lengthdir_x(60, image_angle+90)
attachY = y + lengthdir_y(60, image_angle+90)

alarm[0] = 18

reeling = false;

image_xscale = 0.25
image_yscale = 0.25

function forceFieldRepulse() {
    var yOffset = sqrt((objAnglerfish.forcefieldRadius * objAnglerfish.forcefieldRadius) - ((x - objAnglerfish.x) * (x - objAnglerfish.x)))

    if (y > objAnglerfish.y) {
        y = objAnglerfish.y + yOffset
    } else if (y < objAnglerfish.y) {
        y = objAnglerfish.y - yOffset
    }
}