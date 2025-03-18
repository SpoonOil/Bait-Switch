/// @description 
if (
    keyboard_check(ord("B")) && 
    keyboard_check(ord("I")) && 
    keyboard_check(ord("X")) && 
    keyboard_check(ord("Y"))
) {
    giveMoney()
}

if (
    keyboard_check(ord("Y")) && 
    keyboard_check(ord("G")) && 
    keyboard_check(ord("I")) && 
    keyboard_check(ord("O"))
) {
    giveMoney()
}

if ( 
    keyboard_check(ord("O")) && 
    keyboard_check(ord("I")) && 
    keyboard_check(ord("L")) && 
    keyboard_check(ord("Y"))
) {
    devMode()
}

if (keyboard_check(vk_control) && keyboard_check(ord("S"))) {
    save()
    
}



if (debugMode) {
    if (keyboard_check(ord("2"))) {
        if (room == CostumeShop) {
            objShop.debugUnlock()
        }
    }
    
    if (keyboard_check(ord("1"))) {
        devMode()
    }
    
    if (keyboard_check(ord("3"))) {
        giveMoney()
    }
}