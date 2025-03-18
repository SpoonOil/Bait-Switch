/// @description 
if (other.state == other.firing) {
    if (!stuck) {
        var _plus = instance_create_layer(x, y, "Booms", objBoom)
        _plus.image_index = 2
        stuck = true;
        stuckTo = other
    }
}