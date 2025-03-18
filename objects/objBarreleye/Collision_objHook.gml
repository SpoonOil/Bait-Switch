/// @description 
if (other.state != other.aiming) {
    if (!stuck) {
        var _plus = instance_create_layer(x, y, "Booms", objBoom)
        _plus.image_index = 2
        stuck = true;
        stuckTo = other
    }
}