/// @description Insert description here

value = 20
stuck = false;
stuckTo = undefined 

function catchFish(hooker) {
    if (!stuck) {
        var _plus = instance_create_layer(x, y, "Booms", objBoom)
        
        _plus.image_index = array_get_index([1, 5, 20, 50, 100], value)
        if (_plus.image_index == -1) {
            _plus.image_index = 0;
        }
        
        stuck = true;
        stuckTo = hooker
    }
}