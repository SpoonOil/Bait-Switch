  /// @description
info = "test info"
infos = []
lockedInfo = "This is locked, to unlock it I need to catch:"
maxInfo = "That's about as much as I can buy."
canSell = global.canSell

price    = 0;
level    = 0
maxLevel = 3

prices = [100, 200, 300, 0]  // 0 is for maxLevel


locked = false;
lockedSprite = undefined

pricetag = "placeholder"

updateLevel = function () {
    
}

updatePrice = function updatePrice () {
    price = prices[level]
    if (level == maxLevel) {
        price = 0
    }
    with (objPriceRender) {
        if (parent == other.pricetag) {
            if (other.price < 1000) {
                value = other.price
            } else {
                value = string(other.price/1000) + "k"
            }
        }
    }
}

function clearButtons () {
    instance_destroy(objBuyButton)
    instance_destroy(objSellButton)
}

function clearOtherButtons(object) {
    
    with (objBuyButton) {
        if (selected != object) {
            instance_destroy()
        }
    }
    
    with (objSellButton) {
        if (selected != object) {
            instance_destroy()
        }
    }
}

function createBuyButton() {
    if ( instance_number(objBuyButton) == 0) {
        
        var _centerx = sprite_width/2
        var _centery = sprite_height/2
        
        var buyButton = instance_create_layer(x+_centerx, y+_centery, "Buttons", objBuyButton)
        buyButton.selected      = self
        return buyButton
    }
    
    return undefined
}

function createSellButton() {
    
    if (!canSell) {
        return
    }
    
    if ( instance_number(objSellButton) == 0) {
        
        var _centerx = sprite_width/2
        var _centery = sprite_height/2
        
        var sellButton = instance_create_layer(x+_centerx, y +_centery-70, "Buttons", objSellButton)
        sellButton.selected     = self
        return sellButton
    }
    
    return undefined
}

function generateButtons() {
    if (objDepthUpgrade.hovered) {
        return
    }
    if (level == 0) {
        var buyButton = createBuyButton()
    } else if (level == maxLevel) {
        var sellButton = createSellButton()
    } else {
        var buyButton = createBuyButton()
        var sellButton = createSellButton()
    }  
}

function regenerateButtons() {
    clearButtons()
    
    if (level == 0) {
        var buyButton = createBuyButton()
    } else if (level == maxLevel) {
        var sellButton = createSellButton()
    } else {
        var buyButton = createBuyButton()
        var sellButton = createSellButton()
    }  
}

function getLevel () {
    
}
