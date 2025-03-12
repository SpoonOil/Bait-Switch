/// @description 

// Inherit the parent event
// Feather disable once GM2040
event_inherited();

info = "A homing harpoon makes avoiding my line a living hell. Multiple harpoons will cascade towards fish in succession. These harpoons are specialized for catching anglers. Just don’t tell Wildlife Services!"

pricetag = "harpoon"
locked = true;

lockedSprite = sprSwordfish

updateLevel = function () {
    level = global.harpoon
}

updatePrice()

function createBuyButton() {
    if ( instance_number(objBuyButton) == 0) {
        
        var _centerx = sprite_width/2
        var _centery = sprite_height/2
        
        var buyButton = instance_create_layer(x+_centerx, y+_centery+50, "Buttons", objBuyButton)
        buyButton.selected      = self
        return buyButton
    }
    
    return undefined
}
getLevel = function () {
    level = global.harpoon
}

function createSellButton() {
    
    if (!global.canSell) {
        return
    }
    
    if ( instance_number(objSellButton) == 0) {
        
        var _centerx = sprite_width/2
        var _centery = sprite_height/2
        
        var sellButton = instance_create_layer(x+_centerx, y +_centery-20, "Buttons", objSellButton)
        sellButton.selected     = self
        return sellButton
    }
    
    return undefined
}