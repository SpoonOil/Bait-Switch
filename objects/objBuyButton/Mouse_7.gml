/// @description 

// Inherit the parent event
event_inherited();

if (global.cash > selected.price) {
    global.cash-=selected.price
    
    var sold = instance_create_layer(x, y, "Booms", objBoom) 
    sold.sprite_index = sprSold
    
    playSound(sndSold)
    selected.level++
    
    if (selected.pricetag == "line") {
        show_debug_message("bruh123")
        objController.goCutscene = true;
    }
    
    selected.updateLevel()
    selected.regenerateButtons()
} else {
    var broke = instance_create_layer(x, y, "Booms", objBoom) 
    broke.image_index = 5
}

function playSound(snd) {
    audio_play_sound(snd, 100, false)
}
