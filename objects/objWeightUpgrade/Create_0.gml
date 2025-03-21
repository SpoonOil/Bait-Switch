/// @description 

// Inherit the parent event
// Feather disable once GM2040
event_inherited();

info = "The more I add the faster my hook’ll drop. These are pristine weights made from the finest lead."

pricetag = "weight"

prices = [200, 800, 1000]
updateLevel = function () {
    global.weight = level
}

getLevel = function () {
    level = global.weight
}

updatePrice()
