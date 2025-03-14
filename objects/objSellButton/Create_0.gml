/// @description bruh 

// Inherit the parent event
event_inherited();

selected        = undefined

image_xscale    = 0.5
image_yscale    = 0.5

if (instance_number(objBuyButton) > 0) {
    image_xscale    = 0.25
    image_yscale    = 0.25
    
    objBuyButton.image_xscale = 0.25
    objBuyButton.image_yscale = 0.25
}