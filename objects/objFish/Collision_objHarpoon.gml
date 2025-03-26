/// @description 

if (other.state == other.firing) {
    if (!stuck) {
        stuck = true;
        stuckTo = other
        
        instance_destroy(objMiniFish)
        with (objAnglerfish) {
            forcefieldFish = []
        }
        instance_destroy(objMiniHook)
        
        other.state = other.finished
    }
}