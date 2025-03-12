/// @description Insert description here
// You can write your code in this editor

draw_roundrect(x+arrowOffset, top, x+arrowOffset+width, bot, false)

draw_triangle(x, y,x+arrowOffset, y+30, x +arrowOffset, y-30, false)

scribble(title)
    .align(fa_center, fa_top)
    .starting_format("fontDisplay", c_black).scale(0.75)
    .draw(x+arrowOffset+width/2, y-height/2+verticalMargin)

for (var i = 0; i < mapAmount; i++) {
    
    var selected = false
    if (currentDepth == i) {
        selected = true
    }
    
    var tintColor = #eeeeee
    if (selected) {
        draw_roundrect_color(
        x + arrowOffset,         top + titleHeight + (rowHeight*i), 
        x + arrowOffset + width, top + titleHeight + (rowHeight*(i+1)), 
        tintColor, 
        tintColor, 
        false
        )
    }
    //draw_rectangle_color(
        //x + arrowOffset,         top + titleHeight + (rowHeight*i), 
        //x + arrowOffset + width, top + titleHeight + (rowHeight*(i+1)), 
        //c_black,
        //c_black,
        //c_black, 
        //c_black, 
        //true)
    
    var scaling = 0.4
    var leftPadding = 60
    
    var thumbnailX = x+arrowOffset + leftPadding
    var thumbnailY = top + titleHeight + (rowHeight*i) + rowHeight/2 - (sprite_get_height(sprLevelThumbnails)*scaling)/2
    draw_sprite_ext(
        mapSprite,
        i,
        thumbnailX,
        thumbnailY,
        scaling, 
        scaling,
        0, 
        c_white, 
        1
    )
    
    var padding = 6
    if (i == 1 && !global.portalUnlock) {
        draw_sprite_ext(
            sprAlert,
            0,
            +padding+thumbnailX+sprite_get_width(sprLevelThumbnails)*scaling, 
            -padding+thumbnailY,
            scaling/1.7, 
            scaling/1.7, 
            0,
            c_white,
            1
        )
    }
    
    var numberx     = x+arrowOffset + leftPadding/2
    var numbery     = top + titleHeight + (rowHeight*i) + rowHeight/2
    var lineWidth   = 3
    
    draw_circle_color(numberx-2, numbery, 20, c_black, c_black, false)
    
    var bubbleColor = c_white
    if (selected) {
        bubbleColor = #21a179
    }
    
    draw_circle_color(numberx-2, numbery, 20 - lineWidth, bubbleColor, bubbleColor, false)

    scribble(string(i+1))
        .starting_format("fontDisplay", c_black).scale(0.75)
        .align(fa_center, fa_middle)
        .scale(0.5)
        .draw(numberx, numbery)
    
}