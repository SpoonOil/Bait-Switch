/// @description 

if (!stuck && other.state != other.aiming) {
    stuck = true;
    stuckTo = other;
    
    with (objAnglerfish) {
            forcefieldFish = []
    }
    
    instance_destroy(objMiniFish)
    instance_destroy(objMiniHook)
    instance_destroy(objHarpoon)
}