dryUnlock = true
invisUnlock = true;

if (global.deaths >= 20 && dryUnlock) {
    dryUnlock = false;
    sprite_index = sprCostumeUnlockDry
}

if (global.beatGame && invisUnlock) {
    invisUnlock = false;
    sprite_index = sprCostumeUnlockInvis
}

