// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function goToCurrentDepth(){
    switch (global.line) {
        case 0:
             room_goto(Fishing)
        break;
        case 1:
             room_goto(Fishing_2)
        break;
        case 2: 
             room_goto(Fishing_3)
        break;
        default: 
             room_goto(TestBlank)
        break; 
    }   
}