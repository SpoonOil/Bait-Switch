/// @description 

updatePrice()

level = global.magnet

if (global.magnetUnlock == true) {
    locked = false;
    
    with (objLockedTape) {
        if (type == "magnet") {
            instance_destroy()
        }
    }
}
