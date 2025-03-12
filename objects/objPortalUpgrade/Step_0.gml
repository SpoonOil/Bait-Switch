/// @description

updatePrice()

if (global.portalUnlock == true) {
    locked = false;
    
    with (objLockedTape) {
        if (type == "portal") {
            instance_destroy()
        }
    }
}
