/// @description Insert description here
// You can write your code in this editor

// First of all, defaults to certain fishes on every depth
// if previous depth is uncaught, spawn previous depth fish
// if game is beaten, replace Depth 2 special fish with Mola
// if Mola is caught, randomize all spawns
specialFishes = [objBarreleye, objSwordfish, objAnglerfish, objMola]

specialSpawned = false
function spawnSpecialFish() {
    if ((room == Fishing || room == Fishing_2 || room == Fishing_3 || room == TestBlank)) {
    
        var _xDiff = random_range(0, 200)
        
        if (specialSpawned = false) {
            
            show_debug_message(global.caughtMola)
            if (global.caughtMola) {
                fishToSpawn = specialFishes[irandom_range(0, array_length(specialFishes)-1)]
                
                show_debug_message("sending rando fish")
                instance_create_layer(0-_xDiff, 300-_xDiff/2, "Instances", fishToSpawn)
                specialSpawned = true;
                
                return
            }
            
            switch (room) {
                case Fishing:
                   instance_create_layer(0-_xDiff, 300-_xDiff/2, "Instances", objBarreleye)
                   specialSpawned = true;
                break;
                case Fishing_2:
                    if (global.beatGame && !global.caughtMola) {
                       instance_create_layer(0-_xDiff, 300-_xDiff/2, "Instances", objMola)
                       specialSpawned = true;
                       return
                   }
                   if (!global.scatterUnlock) {
                       instance_create_layer(-100-_xDiff, 300, "Instances", objBarreleye)
                       specialSpawned = true;
                   } else {
                       instance_create_layer(-100-_xDiff, 700, "Instances", objSwordfish)
                       specialSpawned = true;
                   }
                 break;
                 case Fishing_3:
                   if (global.bait = 3 && 
                       global.harpoon = 3 &&
                       global.magnet = 3 &&
                       global.weight = 3 &&
                       global.scatter = 2) {
                       instance_create_layer(-100-_xDiff, room_height/2+150, "Instances", objWhale)
                       specialSpawned = true;
                   } else if (!global.scatterUnlock) {
                       instance_create_layer(-100-_xDiff, 300, "Instances", objBarreleye)
                       specialSpawned = true;
                   } else if (!global.harpoonUnlock) {
                       instance_create_layer(-100-_xDiff, 700, "Instances", objSwordfish)
                       specialSpawned = true;
                   } else {
                       instance_create_layer(-100-_xDiff, choose(400, 500, 660), "Instances", objAnglerfish) 
                       specialSpawned = true;  
                   }
                break;
                case TestBlank:
                    show_debug_message("bruh")
                    instance_create_layer(0 -_xDiff, 520, "Instances", objMola) 
                    specialSpawned = true;  
                break;
                    
           }
        }
    }
}