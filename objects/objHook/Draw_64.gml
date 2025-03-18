/// @description 

var lines = []
array_copy(lines, 0, linePoints, 0, array_length(linePoints))
drawPortalLines(lines)

if (!checkOffscreen() && array_length(lines) > 0) {
    var lineSrcX = lines[0][0]
    var lineSrcY = lines[0][1]
    drawMainLine(lineSrcX, lineSrcY)
}


function drawMainLine(lineSrcX, lineSrcY) {
    var dist = 0
    var segments = 100
    var segLength = 0
    var baseVariance = 0.015
    var variance = 0
    var offset2 = 0
    var threshHoldFactor = 0.85
    switch (orientation) {
        
        //Im sorry
        
        case "top":
            dist = abs(attachY - lineSrcY)
            segLength = dist/segments
            variance = baseVariance * (room_height*threshHoldFactor - dist)
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
            variance = baseVariance * (room_height*threshHoldFactor - dist)
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
            variance = baseVariance * (room_width*threshHoldFactor - dist)
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
            variance = baseVariance * (room_width*threshHoldFactor - dist)
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

function drawPortalLines(linesArray) {
    while (array_length(linesArray) > 1) {
        var point1 = array_shift(linesArray)
        var point2 = array_shift(linesArray)
        
        draw_line(point1[0], point1[1], point2[0], point2[1])
    }
}

if (checkOffscreen() && state != reeling && state != unPortalling) {
    renderCallout()
}

function renderCallout() {
    var calloutX = 0
    var calloutY = 0
    var calloutRotation = 0
    switch (orientation) {
        case "top":
            calloutX = x
            calloutY = 0
            calloutRotation = 0
            break;
        case "left":
            calloutX = 0
            calloutY = y
            calloutRotation = 90
            break;
        case "bot":
            calloutX = x
            calloutY = room_height
            calloutRotation = 180
            break;
        case "right":
            calloutX = room_width
            calloutY = y
            calloutRotation = 270
            break;

    }
    
    draw_sprite_ext(sprCallout, 0, calloutX, calloutY, 0.2, 0.2, calloutRotation, c_white, 1)
}

if (debugInfo) {
    draw_text(10, 100, string(x)+", "+string(y))
}

//attach points for line
attachX = x + lengthdir_x(60, image_angle+90)
attachY = y + lengthdir_y(60, image_angle+90)