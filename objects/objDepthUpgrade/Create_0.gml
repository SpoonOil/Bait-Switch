/// @description 

// Inherit the parent event
// Feather disable once GM2040
event_inherited();

info = "The more line I add, the deeper I can fish. The deeper I can fish, the more expensive fish I can catch. I also  heard in deeper levels of this pond there's been a starfish outbreak."
info2 = "Now I can fish in a deeper level of the pond. Conditions are perfect for a starfish bloom, I wouldn't be suprised if I start reeling some up. Grandpa used to tell me the fishes use seastars as currency, and Grandpa was never wrong."
maxInfo = "WE NEED TO GO DEEPER! Just kidding, actually, that's it. I think I've gone as deep as I can. The fish are going to get uglier and the starfish should be just as abundant. Strange vibrations keep traveling up my line and into my hand."

infos = [info, info2]

prices = [350, 800, 0]

maxLevel = 2; 

pricetag ="line"

hovered = false;

hoverHint = true;

updateLevel = function () {
    global.line = level
    
    if (level == 1) {
        global.spawnStarfish = true
    }
}

getLevel = function () {
    if (!global.beatGame) {
        level = global.line
    } else {
        level = 2
    }
}
    
updatePrice()
