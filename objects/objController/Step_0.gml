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


if (keyboard_check(vk_control) && keyboard_check(ord("G"))) {
    room_goto(GraphRoom)
}



if (debugMode) {
    if (keyboard_check(ord("2"))) {
        if (room == CostumeShop) {
            objShop.debugUnlock(["Da Last Laugh"])
        }
    }
    
    if (keyboard_check(ord("1"))) {
        devMode()
    }
    
    if (keyboard_check(ord("3"))) {
        giveMoney()
    }
    
    if (keyboard_check(vk_right)) {
        room_goto(TestBlank2)
    }
    if (keyboard_check(vk_left)) {
        room_goto(TestBlank)
    }
}

timer++

