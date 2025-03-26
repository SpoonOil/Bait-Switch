/// @description 

// Inherit the parent event
event_inherited();
if (global.anglerFails == 3) {
    // this is a stupid way to disable the Tutorial1 Condition while letting the player begin working
    //towards tutorial2
    global.anglerFails = 10 
    
    room_goto(AnglerTutorial)
    exit
}

if (global.anglerFails >= 16) {
    global.anglerFails = -999999
    room_goto(AnglerTutorial2)
    exit
}

if (global.deaths == 20) {
    objUnlockHandler.startUnlock(sprCostumeUnlockDry)
    exit
}

room_goto(Dock)