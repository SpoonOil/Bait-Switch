/// @description Insert description here
// You can write your code in this edito
creditsY = 0
creditsString = getCreditsString()
spd = 0.25

function draw_bg() {
    var bg1 = sprDepth1BG
    var bg2 = sprDepth2BG
    var bg3 = sprDepth3BG
    
    draw_sprite(bg1, 0, 0, creditsY)
    draw_sprite(bg2, 0, 0, creditsY+720)
    draw_sprite(bg3, 0, 0, creditsY+720*2)
}