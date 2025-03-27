 /// @description 

// Inherit the parent event
// Feather disable once GM2040
event_inherited();

info = "A magnet that attracts fish. A lot cleaner and less smelly than chum. Designed and engineered by a mad scientist sea captain. If it didn’t cost an arm and a leg, every fishman would have one. I got mine from a Flikstarter Campaign. It came with a cool keychain!"
pricetag = "magnet"

locked = true;
lockedSprite = sprAnglerfish

prices = [2000, 4000, 8000, 0]

updateLevel = function () {
    global.magnet = level
}

getLevel = function () {
    level = global.magnet   
}

updatePrice()
