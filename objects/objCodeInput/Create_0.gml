/// @description Insert description here
// You can write your code in this editor
defaultText = " "
codeText = defaultText
bgColor = c_black
active = false
lastChar = undefined
currentChar = undefined

baseCooldown = 10
cooldown = 0
key = undefined

for (var _i = 0; _i < array_length(global.usedCodes); _i++) {
    activateCode(global.usedCodes[_i])
}

function activateCode(code) {
    switch (code) {
        case "DEBUG":
            objShop.unlockCostume("Da Alpha");
            break;
        case "IMGAY":
            objShop.unlockCostume("Da Bow");
            break;
        case "BEEG":
            objShop.unlockCostume("Da Bow");
            break;
        case "RORY":
            objShop.unlockCostume("Da Discreet");
            break;
        case "BADZOO":
            objShop.unlockCostume("Da Fetid Fish");
            break;
        case "GHOOL":
            objShop.unlockCostume("Da Fetid Fish");
            break;
        case "SHANNONR":
            objShop.unlockCostume("Da Pinky");
            break;
        case "ZOEZAP":
            objShop.unlockCostume("Da Pinky");
            break;
        case "SHRIMP12":
            objShop.unlockCostume("Da Pinky")
            break;
        case "DOH":
            objShop.unlockCostume("Da Yellow Pop");
            break;
        case "GOED":
            array_push(objShop.costumes, 
            {
                sprite: sprJamCost,
                name: "Da Jammer",
                checkUnlocked: function () {
                    return true;
                },
                locked: false,
                owned: false,
                price: 0,
                cashPay: true,
                lockedText: "",
                flavorText: "First place! In your face!"
            })
            objShop.unlockCostume("Da Jammer");
            break;
        case "11101969":
            objShop.unlockCostume("Da Grouch");
            break;
        case "EVYN":
            objShop.unlockCostume("Da Alpha");
            break;
        case "JON":
            objShop.unlockCostume("Da Alpha");
            break;
        case "EMORY":
            objShop.unlockCostume("Da Alpha");
            break;
        case "IANBROWN":
            var squeakCost = 
            {
                sprite: sprSqueakCost,
                name: "Da Squeak",
                checkUnlocked: function () {
                    return true;
                },
                locked: false,
                owned: false,
                price: 0,
                cashPay: true,
                lockedText: "",
                flavorText: "The Original Meme Machine"
            }
            array_push(objShop.costumes, squeakCost)
            objShop.unlockCostume("Da Squeak");
            break;
        case "MOUSE":
            objShop.unlockCostume("Da Old Fashioned");
            break;
        case "RISKYSPR":
            objShop.unlockCostume("Da 'Urple")
            break;
        case "JACKCRAW":
            objShop.unlockCostume("Da 'Urple")
            break;
        case "CRASH":
            game_end()
            break;
        case "IVANKOBE":
            objShop.unlockCostume("Da Silverfish")
            break;
        case "CANTSPEL":
            var oldBarrel =     {
               sprite: sprBarreleyeCost,
               name: "Da ProtoBarreleye",
               checkUnlocked: function () {
                   return true;
               },
               locked: false,
               owned: false,
               price: 0,
               cashPay: true,
               lockedText: "",
               flavorText: "Redundant, but not removed."
            }
            array_push(objShop.costumes, oldBarrel)
            break;
        case "BADCOST":
            var oldAngler =     {
               sprite: sprAnglerfishCost,
               name: "Da ProtoAnglerfish",
               checkUnlocked: function () {
                   return true;
               },
               locked: false,
               owned: false,
               price: 0,
               cashPay: true,
               lockedText: "",
               flavorText: "It’s still in the code!"
            }
            array_push(objShop.costumes, oldAngler)
            break;
        case "KASEM":
            objShop.unlockCostume("Da Mounted")
            break;
        case "WALNUTS":
            objShop.unlockCostume("Da Mounted")
            break;
        case "BIXBY":
            objShop.unlockCostume("Da Cooler White Green and Red One")
            break;
        case "YOGI":
            objShop.unlockCostume("Da White Green and Red One")
            break;
    }
}

function markSuccess() {
    codeText = "SUCCESS!"
    alarm[0] = 45
}
