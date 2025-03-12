/// @description 

// Inherit the parent event
// Feather disable once GM2040
event_inherited();

info = "“Go away, baitin’.” The strong aroma of the bait will attract more fish to my fishing spot. I got it from my favorite spot, Jerry’s Bait Shop (you know the place)."
info2 = "I don't know what else I can use as bait... there is one more thing, but I was saving it for myself."

maxInfo = "That's about as much as I can buy ...for now."

infos = [info, info, info, info2]

price = 10;

prices = [100, 200, 300, 400, 0]

pricetag = "bait"
maxLevel = 3

updateLevel = function () {
    global.bait = level
}

getLevel = function () {
    level = global.bait
}

updatePrice()
