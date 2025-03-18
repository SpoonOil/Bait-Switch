/// @description 

direction = 0

speed = 4

var _scale = 0.50

forcefieldRadius = 300 * _scale
forcefieldFish = []

forcefieldRotation = 0
forcefieldRotSpeed = 3
value = 100
stuck = false;
stuckTo = undefined 

forcefieldDeviations = []

deviation = 0
deviationSpeed = 0.2
maxDev = 10

repeat (11) {
    var fish = instance_create_depth(x, y, 200, objMiniFish)
    var sprites = [sprFish, sprSquirt, sprCatfish]
    var sprite = sprites[irandom_range(0,2)]
    fish.sprite_index = sprite
    array_push(forcefieldFish, fish)
}

fishCap = 60

image_xscale = _scale
image_yscale = _scale