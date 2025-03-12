/// @description 



while (fishToSpawn > 0 && global.spawnFishes) {
    fishToSpawn--;
    var _newFish = instance_create_layer(random_range(0, room_width), random_range(100, room_height), "Instances", objMiniFish);
}


while (starfishToSpawn > 0 && (global.spawnStarfish || !global.spawnFishes) ) {
    starfishToSpawn--;
    var _buffer = 50
    var _newX = random_range(0, room_width- _buffer)
    var _newY = random_range(100, room_height - _buffer)
    while (checkForStarsNearby(_newX, _newY, 200)) {
        _newX = random_range(0, room_width- _buffer)
        _newY = random_range(100, room_height - _buffer)
    }
    var _newStar = instance_create_depth(_newX, _newY, -500, objStar)
}

function checkForStarsNearby(newX, newY, range) {
    with (objStar) {
        if (point_distance(x, y, newX, newY) < range) {
            return true
        }
    }
    
    with (objFish) {
        if (point_distance(x, y, newX, newY) < range) {
            return true
        }
    }
    
    return false
}