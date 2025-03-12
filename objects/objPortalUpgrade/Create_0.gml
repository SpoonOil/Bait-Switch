/// @description 

// Inherit the parent event
// Feather disable once GM2040
event_inherited();

info = "Sends bait through the fabric of spacetime to catch fish from angles never thought possible. The Worm Hole is an experimental anomaly I bought in the back alley behind a fishing expo. Those fish’ll never see a hook coming up from below! "

pricetag = "portal"
canSell = true
locked = true;
lockedSprite = sprMola
maxLevel = 100

prices = []
for (var i = 0; i < maxLevel; i++) {
  price = i * 100
  array_push(prices, price)
}

updateLevel = function () {
    global.portal = level
}

getLevel = function () {
    level = global.portal    
}

updatePrice()
