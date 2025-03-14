/// @description Insert description here
// You can write your code in this editor

drawMainLine(spawnx, spawny)
/**
 * Function Description
 * @param {any*} lineSrcX Description
 * @param {any*} lineSrcY Description
 */
function drawMainLine(lineSrcX, lineSrcY) {
    var attachX = x + lengthdir_x(60, image_angle+90)
    var attachY = y + lengthdir_y(60, image_angle+90)
    
    var dist = 0
    var segments = 100
    var segLength = 0
    var variance = 0
    var offset2 = 0
    switch (orientation) {
        
        //Im sorry
        
        case "top":
            dist = abs(attachY - lineSrcY)
            segLength = dist/segments
            variance = 0.02 * (room_height/1.5 - dist)
            if (variance < 0) variance = 0
            offset2 = sin(0/10) * variance
            
            for (var i = 0; i < segments; i++) {
                var offset1 = offset2
                offset2 = sin(i/pi) * variance
                var segStartX = lineSrcX + offset1
                var segEndX = attachX + offset2
                var segStartY = lineSrcY + i*segLength
                var segEndY = lineSrcY + i*segLength + segLength
                
                draw_line(segStartX, segStartY, segEndX, segEndY)
            }
            break;
        case "bot":
            dist = abs(attachY - lineSrcY)
            segments = 100
            segLength = dist/segments
            variance = 0.02 * (room_height/1.5 - dist)
            if (variance < 0) variance = 0
            offset2 = sin(0/10) * variance
            
            for (var i = 0; i < segments; i++) {
                var offset1 = offset2
                offset2 = sin(i/pi) * variance
                var segStartX = lineSrcX + offset1
                var segEndX = attachX + offset2
                var segStartY = lineSrcY - i*segLength
                var segEndY = lineSrcY - i*segLength - segLength
                
                draw_line(segStartX, segStartY, segEndX, segEndY)
            }
            break;
        case "left":
            dist = abs(attachX - lineSrcX)
            segments = 100
            segLength = dist/segments
            variance = 0.02 * (room_width/1.5 - dist)
            if (variance < 0) variance = 0
            offset2 = sin(0/10) * variance
            
            for (var i = 0; i < segments; i++) {
                var offset1 = offset2
                offset2 = sin(i/pi) * variance
                var segStartX = lineSrcX + i*segLength
                var segEndX = lineSrcX + i*segLength + segLength
                var segStartY = lineSrcY + offset1
                var segEndY = attachY + offset2
                
                draw_line(segStartX, segStartY, segEndX, segEndY)
            }
            break;
        case "right":
            dist = abs(attachX - lineSrcX)
            segments = 100
            segLength = dist/segments
            variance = 0.02 * (room_width/1.5 - dist)
            if (variance < 0) variance = 0
            offset2 = sin(0/10) * variance
            
            for (var i = 0; i < segments; i++) {
                var offset1 = offset2
                offset2 = sin(i/pi) * variance
                var segStartX = lineSrcX - i*segLength
                var segEndX = lineSrcX - i*segLength - segLength
                var segStartY = lineSrcY + offset1
                var segEndY = attachY + offset2
                
                draw_line(segStartX, segStartY, segEndX, segEndY)
            }
            break;
    }
}
draw_self()

draw_sprite_ext(sprMagnet, 1, x, y, image_xscale, image_yscale, 0, c_white, 1)

draw_sprite_ext(sprBait, global.bait-1, x, y, image_xscale, image_yscale, 0, c_white, 1)
