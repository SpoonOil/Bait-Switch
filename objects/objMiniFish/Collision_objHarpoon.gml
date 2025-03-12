/// @description 

if (other.state = other.firing) {
    if (!stuck) {
        var _plus = instance_create_layer(x, y, "Booms", objBoom)
        if (sprite_index == sprFlounder || sprite_index == sprFreakFish) {
            _plus.image_index = 2
        } else if (sprite_index = sprEel) {
            _plus.image_index = 3
        }
        stuck = true;
        stuckTo = other
        objFishSpawner.fishToSpawn++;

    }
}