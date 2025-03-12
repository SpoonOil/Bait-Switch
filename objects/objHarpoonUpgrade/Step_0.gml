/// @description 

// Inherit the parent event
event_inherited();

if (global.harpoonUnlock == true) {
    locked = false;
    
    with (objLockedTape) {
        if (type == "harpoon") {
            instance_destroy()
        }
    }
}

