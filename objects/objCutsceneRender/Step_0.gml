/// @description 
frame++

if (frame == maxFrames) {
    if (global.tutorial1) {
        global.tutorial1 = false;
        room_goto(Tutorial)
    }
    else if (global.line == 1 && global.tutorial2) {
        global.tutorial2 = false;
        room_goto(StarTutorial)
        exit
    } else {
        goToCurrentDepth()
    }
}

