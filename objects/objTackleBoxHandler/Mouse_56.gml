/// @description Insert description here
// You can write your code in this editor

var clickedOn = checkClicked(mouse_x, mouse_y)
if ( clickedOn == "none" || clickedOn == "locked") {
    clearButtons()
}

function clearButtons () {
    instance_destroy(objBuyButton)
    instance_destroy(objSellButton)
}

function checkClicked(x, y) {
    var objectHovered = undefined
    
    with (_objUpgradeParent) {
        
        if (position_meeting(mouse_x, mouse_y, self)) {
            if (self.locked == true) {
                objectHovered = "locked"
                var lock = instance_create_layer(self.x+sprite_width/2, self.y+sprite_height/2, "Buttons", objLock)
            } else {
                objectHovered = "clickable"
            }
            
        }
    }
    
    if (objectHovered == undefined) {
        return "none"
    } else {
        return objectHovered
    }
}