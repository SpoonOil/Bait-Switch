/// @description Insert description here
// You can write your code in this editor

scaling+=scaleVelocity

if ((scaling > baseScaling + maxDiff)||(scaling < baseScaling - maxDiff)) {
    scaleVelocity*=-1
}
    
image_xscale = scaling
image_yscale = scaling

keepInBounds()
state()
