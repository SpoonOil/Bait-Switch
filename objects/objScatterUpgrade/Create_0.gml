/// @description 

// Inherit the parent event
// Feather disable once GM2040
event_inherited();

info = "The scatter shot adds an additional hook (Max of 3) to my cast, spreading out my range and scooping up fish with the efficiency of a net (without the environmental hazards). More spread = More fish."
pricetag = "scatter"
locked = true;

prices = [150, 500, 0]
maxLevel = 2
lockedSprite = sprBarreleye

updateLevel = function () {
    global.scatter = level
}

getLevel = function () {
    level = global.scatter    
}

updatePrice()