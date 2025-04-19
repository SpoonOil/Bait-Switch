/// @description 
global.selectedSprite = sprDefaultFish

global.line    = 0;
global.bait     = 0;
global.weight   = 0;

global.magnet   = 0;


global.harpoon  = 0;
global.scatter  = 0;
global.portal   = 0;

// TRACKERS
global.cash             = 0;
global.caught           = 0;
global.deaths           = 0;
global.starfish         = 0;
global.starfishCaught   = 0;
global.eelsCaught       = 0;
global.anglerFails      = 0;
global.molaBounces      = 0;
global.dashes           = 0;

global.usedCodes        = []
global.finishedUnlocks  = []

global.scatterUnlock    = false;
global.harpoonUnlock    = false;
global.magnetUnlock     = false;
global.portalUnlock     = false;
global.saved            = false;

global.spawnFishes      = true;
global.spawnStarfish    = false;
global.hookActive       = true;
global.dev              = false;
global.canSell          = false;
global.beatGame         = false;
global.caughtMola       = false;
global.firstBounce      = true;
global.firstFish        = false;

global.tutorial1        = true;
global.tutorial2        = true;

goCutscene = true;
debugMode = false;
timer = 0
songs = []
image_xscale = 0.5
image_yscale = 0.5

devMode = function () {
    if (global.dev) {
        global.dev = false;
        return
    }
    global.dev              = true;
    global.cash             = 99999
    global.scatterUnlock    = true;
    global.harpoonUnlock    = true;
    global.magnetUnlock     = true;
    global.beatGame         = true
    global.caughtMola       = true;
    global.portalUnlock     = true;
    if (instance_number(objDepthUpgrade) > 0) {
        objDepthUpgrade.level = objDepthUpgrade.maxLevel
        objDepthUpgrade.updateLevel()
        objDepthUpgrade.updatePrice()
    }
}

giveMoney = function() {
    global.cash = 99999
    global.starfishCaught = 99999
    global.starfish = 99999
}

function save() {
    var save = {
        selectedSprite: global.selectedSprite,
        bait : global.bait, 
        line : global.line,
        weight : global.weight,
        magnet : global.magnet,
        harpoon : global.harpoon,
        scatter : global.scatter,
        portal : global.portal,
        cash: global.cash,
        caught : global.caught,
        deaths: global.deaths,
        starfish : global.starfish,
        starfishCaught : global.starfishCaught,
        eelscaught : global.eelsCaught,
        anglerFails : global.anglerFails,
        molaBounces : global.molaBounces,
        dashes : global.dashes,
        usedCodes : global.usedCodes,
        scatterUnlock : global.scatterUnlock,
        harpoonUnlock : global.harpoonUnlock,
        magnetUnlock : global.magnetUnlock,
        portalUnlock : global.portalUnlock,
        beatGame : global.beatGame,
        caughtMola : global.caughtMola,
        firstBounce : global.firstBounce,
        firstFish : global.firstFish,
        tutorial1 : global.tutorial1,
        tutorial2 : global.tutorial2,
        spawnStarfish : global.spawnStarfish,
        finishedUnlocks : global.finishedUnlocks,
        data
    }
    
    var saveString = json_stringify(save)
    
    saveStringToFile("saveData", saveString)
    if (instance_number(objSaveDisplay) < 1) {
        var saveIndicator = instance_create_layer(room_width/2, -scribble("Game Saved!").starting_format("fontDisplay", c_white).get_height(), "Instances", objSaveDisplay)
    }
}

data = []

function Data(
    _time, 
    _cash, 
    _caught, 
    _line, 
    _bait, 
    _magnet, 
    _harpoon, 
    _portal, 
    _weight, 
    _scatter,
    _stars,
    _starsCaught
) 
constructor {
    time = _time;
    caught = _caught;
    line = _line;
    bait = _bait;
    magnet = _magnet;
    harpoon = _harpoon;
    portal = _portal;
    weight = _weight;
    scatter = _scatter;
    cash = _cash;
    stars = _stars;
    starsCaught = _starsCaught
}

function collectData() {
    var dataPoint = new Data(
    // theres gotta be a better way to do this.
    timer, 
    global.cash, 
    global.caught, 
    global.line, 
    global.bait, 
    global.magnet, 
    global.harpoon, 
    global.portal, 
    global.weight, 
    global.scatter,
    global.starfish,
    global.starfishCaught)
    array_push(data, dataPoint)
}

function load() {
    var buffer = buffer_load("saveData.dat")
    
    var saveString = buffer_read(buffer, buffer_string)
    var save = json_parse(saveString)
    
    struct_foreach(save, function (key, value) {
        variable_global_set(key, value)
    })
    
    data = save.data
    
    if (instance_number(objLoadDisplay) < 1) {
        var saveIndicator = instance_create_layer(room_width/2, -scribble("Game Loaded!").starting_format("fontDisplay", c_white).get_height(), "Instances", objLoadDisplay)
    }
}

if (file_exists("saveData.dat")) {
    load()
}

//devMode()

unlockHandler = instance_create_depth(x, y, 0, objUnlockHandler)