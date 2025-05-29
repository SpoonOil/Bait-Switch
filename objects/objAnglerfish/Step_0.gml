/// @description 

if (array_length(forcefieldFish) > 0) {
    var fishRotation = forcefieldRotation
    var fishGap = 16.18 * 2
    var deviation = 0
    var dDeviation = 0
    for (var i = 0; i < array_length(forcefieldFish); i++) {
        var fish = forcefieldFish[i]
        
        if (!instance_exists(fish)) {
            show_debug_message("no object at index "+ string(fish))
            forcefieldFish[i] = -1;
            continue
        }
        
        //var xDeviation = lengthdir_x(forcefieldDeviations[i], point_direction(x, y, fish.x, fish.y))
        //var yDeviation = lengthdir_y(forcefieldDeviations[i], point_direction(x, y, fish.x, fish.y))
        fish.x = x + lengthdir_x(forcefieldRadius, fishRotation)
        fish.y = y + lengthdir_y(forcefieldRadius, fishRotation)
        
        fishRotation += fishGap
        
        nextFishX = x + lengthdir_x(forcefieldRadius, fishRotation)
        nextFishY = y + lengthdir_y(forcefieldRadius, fishRotation)
        fish.image_angle = point_direction(fish.x, fish.y, nextFishX, nextFishY)
    }
}

cleanUpForcefield()


forcefieldRotation+=forcefieldRotSpeed

if (stuck) {
    speed= 0
    
    x = stuckTo.x
    y = stuckTo.y
    
    image_angle = 90
    
} else {
}