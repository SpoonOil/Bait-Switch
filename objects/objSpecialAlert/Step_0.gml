/// @description 
var _scale = 0.5

image_alpha = clamp(image_alpha + variance, 0, 1);

if (image_alpha = 0 || image_alpha = 1) {
    variance*=-1
}