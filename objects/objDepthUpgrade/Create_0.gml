/// @description 

// Inherit the parent event
// Feather disable once GM2040
event_inherited();

info = "The more line I add, the deeper I can fish. The deeper I can fish, the more expensive fish I can catch. I also  heard in deeper levels of this pond there's been a starfish outbreak."
info2 = "Looks like there's some starfish tangled in my line, hope there's not a starfish bloom.  Fish use seastars as currency, my grandpa told me that when I was a little kid, and he was never wrong."
maxInfo = "WE NEED TO GO DEEPER! Just kidding, actually, that's it. I think I've gone as deep as I can. The fish are going to get uglier and the starfish should be just as abundant. Strange vibrations keep traveling up my line and into my hand."

infos = [info, info2]

prices = [200, 800, 1000, 0]

maxLevel = 2; 

pricetag ="line"

hovered = false;

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
