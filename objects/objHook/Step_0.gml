

// update position

var moveDist = vy*(1+0.15*weightLevel) // move distance regardless of direction
switch (orientation) {
    case "top":
        x+=0
        y+=moveDist
        break;
    case "left":
        x+=moveDist
        y-=0
        break;
    case "right":
        x-=moveDist
        y+=0
        break;
    case "bot":
        x-=0
        y-=moveDist
        break;
}

if (global.hookActive) {
    
    state()
}

//connection point for the line

