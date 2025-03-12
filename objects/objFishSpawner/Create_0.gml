/// @description 

fishToSpawn = 80+10*(global.bait)
starfishToSpawn = floor(random_range(4, 7.999))

if (global.bait == 4) {
    starfishToSpawn = floor(random_range(6, 12.999))
}