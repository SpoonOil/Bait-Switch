/// @description Insert description here

value = 20
stuck = false;
stuckTo = undefined 

function catchFish(hooker) {
    if (!stuck) {
        var _plus = instance_create_layer(x, y, "Booms", objBoom)
        _plus.image_index = 3
        stuck = true;
        stuckTo = hooker
    }
}