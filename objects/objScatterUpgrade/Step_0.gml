/// @description 

// Inherit the parent event
event_inherited();
 
if (global.scatterUnlock == true) {
    locked = false;
    
    with (objLockedTape) {
        if (type == "scatter") {
            instance_destroy()
        }
    }
}
