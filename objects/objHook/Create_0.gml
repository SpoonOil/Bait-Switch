/// @description 
aiming = function () {
    vy = 0 
    var _dist = objFish.x - x; 
    
    var repeats = irandom_range(1, 3)
    for (var i = 0; i < repeats; i++) {
        vx += _dist/10 
    }
    
    var spd = abs(vx)
    
    if (spd > maxXSpd) {
        vx*=maxXSpd/spd
    }
    
    x+=vx
    return "aiming"
}

spawnHarpoon = function () {
    canHarpoon = false;
    var _harpoon = undefined
    var _harpoon2 = undefined
    var _harpoon3 = undefined
    switch (harpoonLevel) {
        case 1:
            _harpoon = instance_create_layer(x, y, "Instances", objHarpoon)
            array_push(harpoons, _harpoon)
        break;
        case 2:
            _harpoon = instance_create_layer(x, y, "Instances", objHarpoon)
            _harpoon2 = instance_create_layer(x, y, "Instances", objHarpoon)
            array_push(harpoons, _harpoon)
            array_push(harpoons, _harpoon2)
        break
        case 3:
            _harpoon = instance_create_layer(x, y, "Instances", objHarpoon)
            _harpoon2 = instance_create_layer(x, y, "Instances", objHarpoon)
            _harpoon3 = instance_create_layer(x, y, "Instances", objHarpoon)
            array_push(harpoons, _harpoon)
            array_push(harpoons, _harpoon2)
            array_push(harpoons, _harpoon3)
        break;
    }
}

triggerHarpoons = function () {
    var _harpoonDelay = 20 // frames
    if (global.difficulty == 0) {
        _harpoonDelay = 30
    }
    if (canTrigger) {
        with (array_shift(harpoons)) {
            if (state != finished) {
                state = cocking
                alarm[0] = 10
            }
        }
        canTrigger = false; 
        triggersLeft--;
        if (triggersLeft) {
            alarm[1] = _harpoonDelay
        }
    }
}

reset = function() {
    popCount = 0
    if (uses = 0) {
        
        if (global.line == 2 && global.magnetUnlock == false && global.harpoonUnlock == true) {
            global.anglerFails++
        }
        
        starsCaught = array_length(objFish.baggedStars)
        
        global.starfishCaught+=starsCaught
        global.starfish+=starsCaught

        if (!global.firstFish) {
          global.firstFish = true
        }
         
        room_goto(Dock)
        
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
        
        if (global.dashes >= 200) {
            objUnlockHandler.startUnlock(sprCostumeUnlockSilverfish)
        }
    }
    y= -32
    state = aiming 
    if (uses > 1) {
        alarm[0] = 100
        
    } else {
        instance_create_layer(room_width/2, 200, "Instances", objSpecialAlert)
        alarm[0] = 220
        alarm[2] = 100
    }
    triggersLeft = harpoonLevel;
    
    canHarpoon = true;
    canTrigger = true;
    harpoons = []
    linePoints = []
    
    portalsStack = []
    portalsLeft = portalLevel
    
    canScatter = true;
    
    reeledPortals = 0
    
    if (objFish.stuck) {
        objFish.x = x
        objFish.y = y
    }
    
    with (objMiniFish) {
        if (stuck) {
            if (sprite_index == sprFlounder || sprite_index == sprFreakFish) {
                global.cash +=5;
                global.caught++;
                instance_destroy()
            } else if (sprite_index == sprEel) {             
                global.cash +=20;
                global.caught++;
                global.eelsCaught++;
                instance_destroy() 
            } else {
                global.cash ++;
                global.caught++;
                instance_destroy()
            }
        }
    }
    

    with (objBarreleye) {
        if (stuck) {
            global.cash +=value;
            global.caught++;
            instance_destroy()
            if (!global.scatterUnlock) { 
                global.scatterUnlock = true;
                objUnlockHandler.startUnlock(sprCaughtDisplay, 3) // Indexes: [Mola, Angler, Sword, Barrel]
            } else {
                
            }
        }

    }
    
    with (objSwordfish) {
        if (stuck) {
            global.cash +=value;
            global.caught++;
            instance_destroy()
            if (!global.harpoonUnlock) { 
                global.harpoonUnlock = true;
                objUnlockHandler.startUnlock(sprCaughtDisplay, 2)
            } else {
            }
        } 

    }
    
    with (objAnglerfish) {
        if (stuck) {
            global.cash +=value;
            global.caught++;
            instance_destroy()
            if (!global.magnetUnlock) { 
                global.magnetUnlock = true; 
                objUnlockHandler.startUnlock(sprCaughtDisplay, 1)
            } else {
            }
        }
    }
    
    with (objMola) {
        if (stuck) {
            global.cash +=value;
            global.caught++;
            global.caughtMola = true;
            instance_destroy()
            if (!global.portalUnlock) { 
                global.portalUnlock = true; 
                objUnlockHandler.startUnlock(sprCaughtDisplay, 0)
            } else {
            }
        }
    }
    
    with (objFish) {
        if (stuck) {
            if (global.difficulty == 0) {
                global.cash = round(global.cash/2)
            } else if (global.difficulty = 1) {
                global.cash = 0
            }
            global.deaths++;
            

            
            room_goto(Loser)
        }
    }
    
    with (objWhale) {
        if (speed = 0) {
            room_goto(TheEnd)
        }
    }
    
    instance_destroy(objMiniHook)
    instance_destroy(objHarpoon) 
    objController.collectData()
}

popCount = 0
function miniCatch() {
    popCount++
    audio_play_sound(sndPop, 10, false, 1, 0, 0.75 + (choose(0.25, -0.25, 0.1, -0.1)))
}
scatterHooks = function () {
    canScatter = false;
    var _miniHook1 = undefined
    var _miniHook2 = undefined
    switch (scatterLevel) {
        case 1:
            _miniHook1 = instance_create_layer(x, y, "Instances", objMiniHook)
            _miniHook1.direction = 310 + image_angle
        break;
        case 2:
            _miniHook1 = instance_create_layer(x, y, "Instances", objMiniHook)
            _miniHook2 = instance_create_layer(x, y, "Instances", objMiniHook)
            _miniHook1.direction = 310 + image_angle
            _miniHook2.direction = 220 + image_angle
        break;
    }
}

sinking = function () {
    vx = 0;
    
    var inForceField = false

    if (instance_number(objAnglerfish) > 0) {
        inForceField = (point_distance(x, y, objAnglerfish.x, objAnglerfish.y) < objAnglerfish.forcefieldRadius)
    }
    
    if (inForceField) {
        forceFieldRepulse()
    }
    var spd = 15
    if (global.difficulty == 0) {
        spd = 12
    }
    var portalBoost = 5
    var canPortal = portalsLeft > 0
    
    var sinkStage = getSinkStage()
    
    if (inForceField) {
        if (instance_number(objHarpoon) > 0) {
            instance_destroy(objHarpoon)
        }
        botTimer = 10
        state = bottomed
        return
    }
    if (sinkStage == 0) {
        vy = spd + array_length(portalsStack)*portalBoost
    } else if (sinkStage == 1 && !canPortal) {
        if (canScatter) {
            scatterHooks()
        }
        
        if (canHarpoon) {
            spawnHarpoon()
        }
        vy = 10
    } else if ((sinkStage == 2 && (!canPortal || objFish.stuck) ) || inForceField) {
        triggerHarpoons()
        botTimer = 30
        state = bottomed
    } else if (checkOffscreen() && canPortal) {
        enterPortalSink()
        state = inPortal
    }
    return "sinking"
}

function forceFieldRepulse() {
    var yOffset = sqrt((objAnglerfish.forcefieldRadius * objAnglerfish.forcefieldRadius) - ((x - objAnglerfish.x) * (x - objAnglerfish.x)))

    if (y > objAnglerfish.y) {
        y = objAnglerfish.y + yOffset
    } else if (y < objAnglerfish.y) {
        y = objAnglerfish.y - yOffset
    }
}

function getSinkStage() {
    var stage1Thresh = 0.5 // 50% of total possible distance
    var stage2Thresh = 0.9
    switch (orientation) {
        case "top":
            if (y > room_height*stage2Thresh) {
                return 2
            } else if (y > room_height*stage1Thresh) {
                return 1
            }
            break;
        case "left":
            if (x > room_width*stage2Thresh) {
                return 2
            } else if (x > room_width*stage1Thresh) {
                return 1
            }
            break;
        case "right":
            if (room_width-x > room_width*stage2Thresh) {
                return 2
            } else if (room_width-x > room_width*stage1Thresh) {
                return 1
            }
            break;
        case "bot":
            if (room_height-y > room_height*stage2Thresh) {
                return 2
            } else if (room_height-y > room_height*stage1Thresh) {
                return 1
            }
            break;
    }
    
    return 0
}

inPortal = function () {
    var portalBoostFactor = 2
    vy = 15 + array_length(portalsStack)*portalBoostFactor
    
    if (!checkOffscreen()) {
        createLinePoint()
        state = sinking
    }
    
    return "inPortal"
}
function enterPortalSink() {
    portalsLeft--
    var portal = {
        dir: orientation,
        px: x,
        py: y
    }
    
    createLinePoint()
    
    array_push(portalsStack, portal)
    var bound = findClosestFishBound()
    
    orientation = bound
    var gap = sprite_width*16
    switch (bound) {
        case "left":
            y = objFish.y
            x = -gap
            break;
        case "right":
            y = objFish.y
            x = room_width+gap
            break;
        case "top":
            y = -gap
            x = objFish.x
            break;
        case "bot":
            y = room_height+gap
            x = objFish.x
        break;
    }
}

function findClosestFishBound() {
    with (objFish) {
        var leftDist = x
        var rightDist = room_width - x
        var topDist = y + 100
        var botDist = room_height - y + 100
        var minDist = min(leftDist, rightDist, topDist, botDist)
        if (minDist = leftDist) {
            return "left"
        }
        if (minDist = rightDist) {
            return "right"
        } 
        if (minDist = botDist) {
            return "bot"
        }
        if (minDist = topDist) {
            return "top"
        }
    }
}

bottomed = function () {
    vy = 0
    botTimer--;
    
    activeHarpoons = false
    
    with (objHarpoon) {
        if (state != finished) {
            other.activeHarpoons = true
        }
    }
    if (botTimer <= 0 && !activeHarpoons) {
        state = reeling
    }
    return "bottomed"
}

reeling = function () {
    vy = -11 - 5*(reeledPortals+1)
    
    var inForceField = false
    if (instance_number(objAnglerfish) > 0) {
        inForceField = (point_distance(x, y, objAnglerfish.x, objAnglerfish.y) < objAnglerfish.forcefieldRadius)
    }
    
    if (inForceField) {
        forceFieldRepulse()
    }
    if (checkOffscreen()) {
        
        if (objFish.stuck && objFish.stuckTo != self) {
            objFish.stuckTo = self
        }
        
        instance_destroy(objMiniHook)
        instance_destroy(objHarpoon)
        if (array_length(portalsStack) == 0) { 
            reset()
        } else {
            
            var portal = array_pop(portalsStack)
            x = portal.px
            y = portal.py
            
            array_pop(linePoints)
            orientation = portal.dir
            reeledPortals++
            state = unPortalling
        }
    }
    return "reeling"
}

unPortalling = function () {
    vy = -15
    if (!checkOffscreen()) {
        array_pop(linePoints)
        state = reeling
    }
    
    return "unPortalling"
}

function atBottom() {
    
    var offset = sprite_height/1.5
    var botThreshold = room_height - offset
    var rightThreshold = room_width - offset
    var leftThreshold = offset
    var topThreshold = offset
    switch (orientation) {
        case "top":
            return (y >= botThreshold)
        case "left":
            return (x >= rightThreshold)
        case "right":
            return (x <= leftThreshold)
        case "bot":
            return (y <= topThreshold)
    }
}

function checkOffscreen() {
    if (y > room_height + sprite_height || y < 0 - sprite_height*image_yscale || x > room_width + sprite_height || x < 0 - sprite_width) {
        return true
    }
    
    return false
}

function createLinePoint() {
    var point = [x, y]
    array_push(linePoints, point)
    return point
}

state = aiming

canHarpoon = true;
canTrigger = true;

harpoons        = []
linePoints      = []
portalsStack    = []

canScatter = true;

scatterLevel    = global.scatter;
weightLevel     = global.weight;
portalLevel     = global.portal;
magnetLevel     = global.magnet;
harpoonLevel    = global.harpoon;
baitLevel       = global.bait;

triggersLeft = harpoonLevel;
portalsLeft = portalLevel;

reeledPortals = 0

uses = 10;
vx = 0;
vy = 0;
attachX = x + lengthdir_x(60, image_angle+90)
attachY = y + lengthdir_y(60, image_angle+90)
xspd = 0
maxXSpd = 15
minXSpd = 0
maxYSpd = 20;
orientation = "top" //where the hook starts and finishes reeling to

debugInfo = false;

image_xscale = 0.25
image_yscale = 0.25

alarm[0] = 100
