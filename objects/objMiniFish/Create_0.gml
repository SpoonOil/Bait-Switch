/// @description 
stuck = false;
state = "swimming"
spd = 0
maxSpd = 8
minSpd = 5
vx = irandom_range(-5, 5)
vy = irandom_range(-5, 5)
protectedRange = 150 - global.bait*10 - random_range(0, 20);
visibleRange = 300
xvelAvg = 0;
yvelAvg = 0;
xposAvg = 0;
yposAvg = 0;
biasAvg = 0
neighboringBoids = 0;

bias = random_range(-5, 5)
closeDx = 0
closeDy = 0

magnetized = false;

stuckTo = undefined

/**
 * Negative values for force nudge towards
 */
function nudgeAwayFrom(object, rangeFactor = 1, strengthMod = 1) {
    with (object) {
        var stuckFlag = false
        if (variable_instance_exists(self, "stuck")) {
            stuckFlag = stuck
        }
        if (point_distance(other.x, other.y, x, y) < other.protectedRange*rangeFactor && !stuckFlag) {
            other.closeDx += (other.x - x ) * strengthMod
            other.closeDy += (other.y - y) * strengthMod
        } 
    }
}

switch (global.line) {
    case 0:
        types = [sprFish, sprFish, sprFish, sprFish, sprFish, sprFish, sprCatfish, sprSquirt, sprSquirt, sprSquirt]
    break;
    case 1:
        types = [sprFish, sprFish, sprFish, sprFish, sprFish, sprFish, sprCatfish, sprCatfish, sprCatfish, sprFlounder]
    break;
    case 2:
        types = [sprFreakFish, sprFreakFish, sprFreakFish, sprFreakFish, sprFreakFish, sprFreakFish, sprFreakFish, sprFlounder, sprFlounder, sprEel]
    break;
}

group = irandom_range(1, 2)
type = array_get(types, irandom_range(0, 9))
sprite_index = type
image_xscale = 0.3
image_yscale = 0.3

updatePosition = function updatePosition () {
    
    closeDx = 0;
    closeDy = 0
    xvelAvg = 0
    yvelAvg = 0
    xposAvg = 0
    yposAvg = 0
    biasAvg = 0
    neighboringBoids = 0
    
    with (objMiniFish) {
        if (other.sprite_index == sprite_index) {
            if (point_distance(x, y, other.x, other.y) < protectedRange*0.75) {
                other.closeDx += other.x - x
                other.closeDy += other.y - y
            }
        } else if (point_distance(x, y, other.x, other.y) < protectedRange) {
            other.closeDx += other.x - x
            other.closeDy += other.y - y
        }
        
        if (point_distance(x, y, other.x, other.y) < visibleRange) {
            
            if (other.sprite_index == sprite_index) {
                other.biasAvg += (other.bias)*3
                
                var schoolingFactor = 3
                other.xvelAvg += vx * schoolingFactor
                other.yvelAvg += vy * schoolingFactor
                
                other.xposAvg += x * schoolingFactor
                other.yposAvg += y * schoolingFactor
                other.neighboringBoids+=schoolingFactor

            } else {
                  other.xvelAvg += vx
                  other.yvelAvg += vy
                  
                  other.xposAvg += x
                  other.yposAvg += y
                other.neighboringBoids++

            }
            
        }
        
    }
    
    with (objAnglerfish) {
        if (point_distance(x, y, other.x, other.y) < forcefieldRadius && array_length(forcefieldFish) < fishCap) {
            other.magnetized = true
            array_push(forcefieldFish, other)
        }
    }
    
    nudgeAwayFrom(objFish, 1.2, 20)
    nudgeAwayFrom(objBarreleye, 1.5, 20)
    if (global.magnet > 0 && objHook.state != objHook.aiming) {
        nudgeAwayFrom(objHook, 1.5+global.magnet*0.5, -30)
    }
    

    
    if (neighboringBoids > 0 ) {
        biasAvg /= neighboringBoids
        xvelAvg /= neighboringBoids
        yvelAvg /= neighboringBoids
        xposAvg /= neighboringBoids
        yposAvg /= neighboringBoids
    }
    
    var matchBiasFactor = 0.0005
    bias += (bias - biasAvg)*matchBiasFactor
    
    var matchingFactor = 0.05
    vx += (xvelAvg - vx)*matchingFactor
    vy += (yvelAvg - vy)*matchingFactor
    
    var AVOIDFACTOR = 0.0025
    vx += closeDx*AVOIDFACTOR
    vy += closeDy*AVOIDFACTOR
    
    var centeringFactor = 0.0005
    vx += (xposAvg - x)*centeringFactor
    vy += (yposAvg - y)*centeringFactor
    
    var biasFactor = 0.05
    vx += bias*biasFactor
    //Update Pos

    

    
    //
    //// AVOID
    //
    //closeDx = 0;
    //closeDy = 0;
    //
    //
    //
    //with (objHook) {
        //if (point_distance(other.x, other.y, x, y) < other.protectedRange*2 && baitLevel == 0) {
            //other.closeDx += ( other.x - x )*1
            //other.closeDy += ( other.y - y )*1
        //} else if (point_distance(other.x, other.y, x, y) < other.protectedRange*(0.5*baitLevel)) {
            //other.closeDx -= ( other.x - x )*1
            //other.closeDy -= ( other.y - y )*1
        //}
        //if (point_distance(other.x, other.y, x, y) < other.visibleRange*2 && magnetLevel > 0) {
            //var _magnetFactor = 0.25
            //other.closeDx -= ( other.x - x )*0.25*magnetLevel
            //other.closeDy -= ( other.y - y )*0.25*magnetLevel
            //magnetized = true;
        //} 
    //}
    //
    //with (objMiniFish) {
        //if ((point_distance(other.x, other.y, x, y) < other.protectedRange/1.5 && !stuck) && !magnetized) {
            //other.closeDx += other.x - x 
            //other.closeDy += other.y - y
        //} 
    //}
    //
    //vx += closeDx*avoidFactor
    //vy += closeDy*avoidFactor
    //
    ////ALIGN
    //xvelAvg = 0;
    //yvelAvg = 0;
    //xposAvg = 0;
    //yposAvg = 0;
    //
    //with (objMiniFish) {
        //if (point_distance(other.x, other.y, x, y) < other.visibleRange) {
            //other.xvelAvg += vx
            //other.yvelAvg += vy
            //other.xposAvg += x
            //other.yposAvg += y
            //other.neighboringBoids++;
        //} 
    //}
    //
    //
    //if (neighboringBoids > 0 ) {
        //xposAvg = xposAvg/neighboringBoids
        //yposAvg = yposAvg/neighboringBoids
        //xvelAvg = xvelAvg/neighboringBoids
        //yvelAvg = yvelAvg/neighboringBoids
    //}
    //
    //vx += (xvelAvg - vx)*matchingFactor
    //vy += (yvelAvg - vy)*matchingFactor
    //
    //vx += (xposAvg - vx)*centeringFactor
    //vy += (yposAvg - vy)*centeringFactor
//
    
    
    // MARGIN
    
    var _topmargin = 100
    var _botmargin = room_height - 100
    var _turnfactor = 1
    if y < _topmargin {
        vy = vy + _turnfactor
    }
    
    if y > _botmargin {
        vy = vy - _turnfactor
    }
        // SPEED
    
    spd = sqrt(vx*vx + vy*vy)
    if (spd > maxSpd) {
        vx = (vx/spd)*maxSpd
        vy = (vy/spd)*maxSpd
    }
    
    if (spd < minSpd) {
        vx = (vx/spd)*minSpd
        vy = (vy/spd)*minSpd
    }
    
    x+=vx
    y+=vy
    
    image_angle = point_direction(x, y, x + vx, y + vy)
}
