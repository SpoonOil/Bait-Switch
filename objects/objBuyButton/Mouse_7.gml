/// @description 

// Inherit the parent event
event_inherited();

if (global.cash > selected.price) {
    global.cash-=selected.price
    
    var sold = instance_create_layer(x, y, "Booms", objBoom) 
    sold.sprite_index = sprSold
    
    playSound(sndSold)
    selected.level++
    selected.updateLevel()
    selected.regenerateButtons()
} else {
    var broke = instance_create_layer(x, y, "Booms", objBoom) 
    broke.image_index = 4
}

function playSound(snd) {
    audio_play_sound(snd, 100, false)
}
