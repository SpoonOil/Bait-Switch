/// @description 
if (other.state() != "aiming") {
    if (!stuck) {
        var _plus = instance_create_layer(x, y, "Booms", objBoom)
        _plus.image_index = 3
        stuck = true;
        stuckTo = other
    }
}