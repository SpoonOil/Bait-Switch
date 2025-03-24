/// @description 
/// 



if (other.state != other.aiming) {
    if (!stuck) {
        var _plus = instance_create_layer(x, y, "Booms", objBoom)
        stuck = true;
        stuckTo = other
        objFishSpawner.fishToSpawn++;
                objHook.miniCatch()

    }
}
