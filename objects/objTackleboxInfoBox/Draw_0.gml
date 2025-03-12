/// @description 

draw_set_font(font1)

if (oldActive != active) {
    oldActive = active
    typist.reset()
}
if (active == undefined) {
    
} else if (active.locked == false && active.level < active.maxLevel) {
    draw_self()
    var textX = x + xOffset
    var textY = y + yOffset
    
    var text = active.info
    
    if (array_length(active.infos) > 0) {
        text = active.infos[active.level]
    }
    
    scribble(text).wrap(320).starting_format("fontTalkin", c_black).draw(textX, textY, typist)
} else if (active.locked == true) {
    draw_self()
    var textX = x + xOffset
    var textY = y + yOffset
    scribble(active.lockedInfo).wrap(320).starting_format("fontTalkin", c_black).draw(textX, textY, typist)
    
    var spriteX = x+sprite_width/2
    var spriteY = y+215
    var sprScaling = 0.75
    if (active.lockedSprite == sprMola) {
        sprScaling = 0.5
        spriteY +=30
    }
    draw_sprite_ext(active.lockedSprite, 0, spriteX, spriteY, sprScaling, sprScaling, 0, c_white, 1)
} else if (active.level == active.maxLevel) {
    draw_self()
    var textX = x + xOffset
    var textY = y + yOffset
    
    var text = active.maxInfo
    
    if (global.beatGame && active == objDepthUpgrade) {
        text = "Why limit myself to just one depth? I can go back to any part of the pond I want!"
    }
    scribble(text).wrap(320).starting_format("fontTalkin", c_black).draw(textX, textY, typist)
}