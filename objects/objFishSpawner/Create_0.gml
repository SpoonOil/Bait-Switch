/// @description 
baitLevel = 0
if (variable_global_exists("bait")) {
    baitLevel = global.bait
}
fishToSpawn = 80+10*(baitLevel)
starfishToSpawn = floor(random_range(4, 7.999))

if (baitLevel == 4) {
    starfishToSpawn = floor(random_range(6, 12.999))
}

if (room == Credits) {
    starfishToSpawn = 20
}