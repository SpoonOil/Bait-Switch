/// @description 
y-=3
var _scale = 0.5
semiAlpha = semiAlpha - 0.025
image_alpha = clamp(semiAlpha, 0, 1);
image_xscale = clamp(image_xscale - 0.025, 0.5, 0.75);
image_yscale = clamp(image_yscale - 0.025, 0.5, 0.75);

if (image_alpha = 0) {
    instance_destroy()
}