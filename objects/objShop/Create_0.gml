/// @description Insert description here
// You can write your code in this editor
offset = 500
targetOffset = 500

oldx = undefined
oldoldx = undefined
selectSpeed = 20
selectedIndex = 1
global.selectedSprite = sprDefaultFish;

scrollFactor = 1.5 // 1 = 1:1 pixel scroll

costumeNames = []

debugRender = false

leftTime = 0
selectedCostume = undefined
costumes = [
    {
        sprite: sprDefaultFish,
        name: "Da Default",
        checkUnlocked: function () {
            return true;
        },
        locked: false,
        owned: true,
        price: 0,
        cashPay: true,
        lockedText: "",
        flavorText: "Nothing beats classic."
    },
 //    {
//        sprite: sprWeightCost,
//        name: "5th special costume tied to weight",
//        checkUnlocked: function () {
            //return false;
        //},
//        locked: true,
//        owned: false,
   //     price: 0,
//        cashPay: true,
    //    lockedText: "think of it and program it in",
   //     flavorText: "Not in the game yet"
    //},
    {
        sprite: sprShadesCost,
        name: "Da Shades",
        checkUnlocked: function () {
            return true;
        },
        locked: false,
        owned: false,
        price: 100,
        cashPay: true,
        lockedText: "",
        flavorText: "I'm tellin' you, you dumb son of a fish! Try 'em on!"
    },
    {
        sprite: sprAlphaCost,
        name: "Da Alpha",
        checkUnlocked: function () {
            return true;
        },
        locked: false,
        owned: false,
        price: 100,
        cashPay: true,
        lockedText: "",
        flavorText: "The OG OG"
    },
    {
        sprite: sprPreAlpha,
        name: "Da Pre-Alpha",
        checkUnlocked: function () {
            return true;
        },
        locked: false,
        owned: false,
        price: 150,
        cashPay: true,
        lockedText: "",
        flavorText: "The OG OG OG"
    },
    {
        sprite: sprDeepCost,
        name: "Da Deep Dweller",
        checkUnlocked: function () {
            return global.line == 2;
        },
        locked: true,
        owned: false,
        price: 230,
        cashPay: true,
        lockedText: "Max upgrade your line",
        flavorText: "Get your freak on"
    },
    {
        sprite: sprPinkCost,
        name: "Da Pinky",
        checkUnlocked: function () {
            return true;
        },
        locked: false,
        owned: false,
        price: 200,
        cashPay: true,
        lockedText: "",
        flavorText: "Oh my god you guys!"
    },
    {
        sprite: sprGrouchCost,
        name: "Da Grouch",
        checkUnlocked: function () {
            return true;
        },
        locked: false,
        owned: false,
        price: 200,
        cashPay: true,
        lockedText: "",
        flavorText: "I grouch, therefor I am"
    },
    {
        sprite: sprInvisCost,
        name: "Da Discreet",
        checkUnlocked: function () {
            return global.beatGame
        },
        locked: true,
        owned: false,
        price: 0,
        cashPay: true,
        lockedText: "Beat Da Game",
        flavorText: "More naked than ever before"
    },
    {
        sprite: sprDryCost,
        name: "Da Dry",
        checkUnlocked: function () {
            return global.deaths >= 20
        },
        locked: true,
        owned: false,
        price: 250,
        cashPay: true,
        lockedText: "Die a lot",
        flavorText: "No bones about it"
    },
    {
        sprite: sprBrightCost,
        name: "Da Bright",
        checkUnlocked: function () {
            return true;
        },
        locked: false,
        owned: false,
        price: 5,
        cashPay: false,
        lockedText: "",
        flavorText: "It hurts to look at"
    },
    {
        sprite: sprMutedCost,
        name: "Da Muted",
        checkUnlocked: function () {
            var bright = objShop.getCostumeFromSprite(sprBrightCost)
            return bright.owned
        },
        locked: true,
        owned: false,
        price: 0,
        cashPay: true,
        lockedText: "Purchase Da Bright",
        flavorText: "That’s better"
    },
    {
        sprite: sprPurpleCost,
        name: "Da 'Urple",
        checkUnlocked: function () {
            return true;
        },
        locked: false,
        owned: false,
        price: 10,
        cashPay: false,
        lockedText: "",
        flavorText: "Answer the age old question"
    },
    {
        sprite: sprInvertedCost,
        name: "Da Inverted",
        checkUnlocked: function () {
            return true;
        },
        locked: false,
        owned: false,
        price: 5,
        cashPay: false,
        lockedText: "",
        flavorText: "Wow."
    },
    {
        sprite: sprWackyCost,
        name: "Da Wacky",
        checkUnlocked: function () {
            return true;
        },
        locked: false,
        owned: false,
        price: 5,
        cashPay: false,
        lockedText: "",
        flavorText: "Yup. Looks pretty wacky to me"
    },
    {
        sprite: sprEmorald,
        name: "Da Emorald",
        checkUnlocked: function () {
            return true;
        },
        locked: false,
        owned: false,
        price: 5,
        cashPay: false,
        lockedText: "",
        flavorText: "It’s not spelled wrong it’s a creative choice"
    },
    {
        sprite: sprItalyCost,
        name: "Da Italy",
        checkUnlocked: function () {
            return true;
        },
        locked: false,
        owned: false,
        price: 5,
        cashPay: false,
        lockedText: "",
        flavorText: "Self explanatory"
    },
    {
        sprite: sprBarrelCost,
        name: "Da Barreleye",
        checkUnlocked: function () {
            return global.scatter == 2;
        },
        locked: true,
        owned: false,
        price: 10000,
        cashPay: true,
        lockedText: "Fully upgrade Scatter",
        flavorText: "A face only a mother could love"
    },
    {
        sprite: sprSwordfishCost,
        name: "Da Swordfish",
        checkUnlocked: function () {
            return global.harpoon == 3;
        },
        locked: true,
        owned: false,
        price: 10000,
        cashPay: true,
        lockedText: "Fully upgrade Harpoon",
        flavorText: "Come in swingin’"
    },
    {
        sprite: sprAnglerCost,
        name: "Da Anglerfish",
        checkUnlocked: function () {
            return global.magnet == 3
        },
        locked: true,
        owned: false,
        price: 10000,
        cashPay: true,
        lockedText: "Fully upgrade magnet",
        flavorText: "There’s something glowing!"
    },
    {
        sprite: sprWhaleCost,
        name: "Da Bloop",
        checkUnlocked: function () {
            return global.caught >=30000;
        },
        locked: true,
        owned: false,
        price: 20000,
        cashPay: true,
        lockedText: "Catch 30000 fish",
        flavorText: "The Big One"
    },
    {
       sprite: sprHomerCost,
       name: "Da Yellow Pop",
       checkUnlocked: function () {
           return global.starfishCaught >= 100
       },
       locked: true,
       owned: false,
       price: 3,
       cashPay: true,
       lockedText: "Collect 100 stars lifetime",
       flavorText: "I wish I wish I hadn’t killed that fish!"
    },
    {
        sprite: sprPollutedCost,
        name: "Da Polluted",
        checkUnlocked: function () {
            return global.starfishCaught >= 200
        },
        locked: true,
        owned: false,
        price: 3000,
        cashPay: true,
        lockedText: "Collect 200 stars lifetime",
        flavorText: "It might actually be a kind of \"Super Fish\""
    },
    {
        sprite: sprStacheCost,
        name: "Da Stache",
        checkUnlocked: function () {
            return true;
        },
        locked: false,
        owned: false,
        price: 30,
        cashPay: false,
        lockedText: "",
        flavorText: "Right under your nose!"
    },
    {
        sprite: sprRainbowCost,
        name: "Da Bow",
        checkUnlocked: function () {
            return true;
        },
        locked: false,
        owned: false,
        price: 35,
        cashPay: false,
        lockedText: "",
        flavorText: "Take pride in your scales"
    },
    {
        sprite: sprPaperCost,
        name: "Da Bubby",
        checkUnlocked: function () {
            var unlocked = 0
            for (var i = 0; i < array_length(objShop.costumes); i++) {
                var costume = objShop.costumes[i]
                if (costume.owned) {
                    unlocked++
                }
            }
            
            return unlocked >= 10
        },
        locked: true,
        owned: false,
        price: 2500,
        cashPay: true,
        lockedText: "Purchase 10 costumes",
        flavorText: "It was a good idea on paper"
    },
    {
        sprite: sprOldFashionedCost,
        name: "Da Silly Willy",
        checkUnlocked: function () {
            var unlocked = 0
            for (var i = 0; i < array_length(objShop.costumes); i++) {
                var costume = objShop.costumes[i]
                if (costume.owned) {
                    unlocked++
                }
            }
            
            return unlocked >= 15
        },
        locked: true,
        owned: false,
        price: 5000,
        cashPay: true,
        lockedText: "Purchase 15 costumes",
        flavorText: "A timeless classic fished out of a grey river"
    },
    {
        sprite: sprJokerCost,
        name: "Da Last Laugh",
        checkUnlocked: function () {
            var anyLocked = array_all(objShop.costumes, function (costume) { 
                var exceptedCostumes = [sprSqueakCost, sprJamCost, sprAnglerfishCost, sprBarreleyeCost]
                if (array_contains(exceptedCostumes, costume.sprite)) {
                    return costume.locked
                } else {
                    return costume.locked
                }
            })
            return anyLocked
        },
        locked: true,
        owned: false,
        price: 199.99,
        cashPay: true,
        lockedText: "Unlock every costume",
        flavorText: "Oh if I'd only seen that the joke was on me"
    },
    {
        sprite: sprRaveCost,
        name: "Da Rave",
        checkUnlocked: function () {
            return global.molaBounces >= 10
        },
        locked: true,
        owned: false,
        price: 50,
        cashPay: false,
        lockedText: "Bounce 10 times",
        flavorText: "Life’s a party"
    },
    {
        sprite: sprMountedCost,
        name: "Da Mounted",
        checkUnlocked: function () {
            return global.caught >= 10000
        },
        locked: true,
        owned: false,
        price: 45,
        cashPay: false,
        lockedText: "Catch 10000 fish",
        flavorText: "Paulie’s favorite"
    },
    {
        sprite: sprRobotCost,
        name: "Da Silverfish",
        checkUnlocked: function () {
            return global.dashes >= 200
        },
        locked: true,
        owned: false,
        price: 5000,
        cashPay: true,
        lockedText: "Dash 200 times",
        flavorText: "It’s 40% titanium and powered by uranium"
    },
    {
        sprite: sprPixelCost,
        name: "Da 8-Bit",
        checkUnlocked: function () {
            return global.portal >= 3
        },
        locked: true,
        owned: false,
        price: 35,
        cashPay: false,
        lockedText: "Buy 3 ??? Upgrades",
        flavorText: ""
    },
    {
        sprite: sprFetidCost,
        name: "Da Fetid Fish",
        checkUnlocked: function () {
            return global.eelsCaught >= 50;
        },
        locked: true,
        owned: false,
        price: 30,
        cashPay: false,
        lockedText: "Catch 50 eels",
        flavorText: "So Bad it's good"
    },
    {
        sprite: sprRealisticCost,
        name: "Da HD",
        checkUnlocked: function () {
            var unlocked = 0
            for (var i = 0; i < array_length(objShop.costumes); i++) {
                if (objShop.costumes[i].locked == false) {
                    unlocked++
                } 
            }
            return unlocked >= 3
        },
        locked: true,
        owned: false,
        price: 30,
        cashPay: false,
        lockedText: "Purchase 3 costumes",
        flavorText: "Computer: Enhance."
    }
]



function unlockCostume(nameString) {
    for (var _i = 0; _i < array_length(costumes); _i++) {
        var costume = costumes[_i];
        if (costumes[_i].name == nameString) {
            costume.locked = false;
            costume.owned = true;
        }
    }
}

totalCostumes = array_length(costumes)

function calculateSelectTargets() {
    var _height = 500
    var _width = room_width
    var _targets = []
    //draw_rectangle(x, y, x+_width, y+_height, true)
    
    var _screenNodes = 5
    var _nodes = totalCostumes
    
    for (var _i = 0; _i < _nodes; _i++) { 
        var _nodeWidth = (_width/_screenNodes)
        var _buffer = (_width/_screenNodes)/2
        var _lowerbound = _width - (_nodeWidth*_nodes) - _buffer
        var _upperbound = x + _buffer + (_nodeWidth*_nodes)
        
        var _x = x + offset + _nodeWidth*_i
        var _y = y + _height / 2

        while (_x > _width) {
            _x -= (_nodeWidth*_nodes)
        } 
        
        //
        while (_x < x-_nodeWidth ) {
            _x += (_nodeWidth*_nodes)
        }
        
        var _select = [_x, _x+_nodeWidth, _i+1]
        
        array_push(_targets, _select)
        //draw_circle(_x, _y+30, 100, false)
        //draw_text(_x-10, _y+200, costumeNames[_i])
        
        var _scaling = 0.5
        
        //draw_sprite_ext(sprFish2, 0, _x, _y+30, _scaling, _scaling, 0, c_white, 1)
    }
    return _targets
}

function getCostumeFromSprite(sprite) {
    for (var i = 0; i < array_length(costumes); i++) {
        var cost = costumes[i]
        if (cost.sprite == sprite) {
            return cost
        }
    }
}

function debugUnlock(exceptList = []) {
    for (var _i = 0; _i < array_length(costumes); _i++) {
        if (!array_contains(exceptList, costumes[_i].name)) {
            costumes[_i].locked = false 
            costumes[_i].owned = true
        }
    }
}

function checkLocked() {
    for (var _i = 0; _i < array_length(costumes); _i++) {
        var _costume = costumes[_i]
        _costume.locked = !_costume.checkUnlocked()
    }
}
function buyCostume(costume) {
    if (costume.cashPay && global.cash >= costume.price) {
        var _sold = instance_create_layer(mouse_x, mouse_y, "Booms", objBoom) 
        _sold.sprite_index = sprSold
        audio_play_sound(sndSold, 10, false)
        costume.owned = true
        global.cash-=costume.price
        checkLocked()
        objController.save()
    } else if (!costume.cashPay && global.starfish >= costume.price) {
        var _sold = instance_create_layer(mouse_x, mouse_y, "Booms", objBoom) 
        _sold.sprite_index = sprSold
        audio_play_sound(sndSold, 10, false)
        costume.owned = true
        global.starfish-=costume.price
        checkLocked()
        objController.save()
    } else {
        broke = instance_create_layer(mouse_x, mouse_y, "Booms", objBoom)
        broke.image_index = 5
    }
}

function getSelected(_x, _y, selectArray) {
    for (var _i = 0; _i < array_length(selectArray); _i++) {
        var _currentSelect = selectArray[_i]
        if (_x < _currentSelect[1]  && _x > _currentSelect[0]) {
            return _currentSelect[2]
        }
    }
    
    return -1
}



