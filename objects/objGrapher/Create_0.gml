/// @description 

width = room_width - x * 2 // equal padding l/r
height = room_height - y * 2
bgColor = c_white

lineLevel       = 0
baitLevel       = 0
magnetLevel     = 0;
scatterLevel    = 0;
harpoonLevel    = 0;
weightLevel     = 0;
portalLevel     = 0;


scaleCache = undefined
function drawBoard(data) {
    
    show_debug_message(array_length(data))
    draw_rectangle_color(x, y, x + width, y + height, bgColor, bgColor, bgColor, bgColor, false)
    
    var lineLength = width / (array_length(data) + 20)
    drawDataLine(data, "caught", c_red, lineLength)
    drawDataLine(data, "cash", c_green, lineLength)
}

function drawLandmark(xx, yy, str, color = c_red) {
    draw_line_color(xx, y, xx, y + height, color, color)
    draw_text(xx, y + height, string(str))
}

function drawDataLine (dataList, property, lineColor, lineLength, startX = x, startY = y+height, index = 0) {
    if (index >= array_length(dataList)) {
        return
    }
    
    if (scaleCache == undefined) {
        var propHash = variable_get_hash(property)
        
        var maxVal = struct_get_from_hash(dataList[0], propHash)
        
        for (var i = 0; i < array_length(dataList); i++) {
            var dataPoint = dataList[i]
            var propVal = struct_get_from_hash(dataPoint, propHash)
            if (propVal > maxVal) {
                maxVal = propVal
            }
        }
        
        var ceilVal = height*0.75
        
        scaleCache = 1
        if (maxVal > ceilVal) {
            scaleCache = ceilVal/maxVal
        }
    }
    
    var scale = 1
    
    var lineWidth = 3
    var dataPoint = dataList[index]
    
    var landmarkY = 0
    
    var adjX = startX // actual x start accounting for origin offset
    
    if (dataPoint.line > lineLevel) {
        lineLevel = dataPoint.line
        drawLandmark(adjX, landmarkY, "line" + string(lineLevel))
        landmarkY += 30
    }
    
    if (dataPoint.bait > baitLevel) {
        baitLevel = dataPoint.bait
        drawLandmark(adjX, landmarkY, "bait" + string(baitLevel))
                landmarkY += 30
    }
    
    if (dataPoint.magnet > magnetLevel) {
        magnetLevel = dataPoint.magnet
        drawLandmark(adjX, landmarkY, "magnet" + string(magnetLevel))
                landmarkY += 30
    }
    
    if (dataPoint.scatter > scatterLevel) {
        scatterLevel = dataPoint.scatter
        drawLandmark(adjX, landmarkY, "scatter"+ string(scatterLevel))
                landmarkY += 30
    }
    
    if (dataPoint.portal > portalLevel) {
        portalLevel = dataPoint.portal
        drawLandmark(adjX, landmarkY, "portal" + string(portalLevel))
                landmarkY += 30
    }
    
    if (dataPoint.harpoon > harpoonLevel) {
        harpoonLevel = dataPoint.harpoon
        drawLandmark(adjX, landmarkY,"harpoon" + string(harpoonLevel))
                landmarkY += 30
        
    }
    
    
    var endX = startX + lineLength
    var endY = y + height*scale - struct_get(dataPoint, property)*scale
    
    draw_text_transformed_color(endX, endY - 20*scale, struct_get(dataPoint, property), 0.5, 0.5, 45, lineColor, lineColor, lineColor, lineColor, 1)
    draw_line_width_color(startX, startY, endX, endY, lineWidth, lineColor, lineColor)
    
    return drawDataLine(dataList, property, lineColor, lineLength, endX, endY, index+1)
}

function resetLandmarks() {
    lineLevel = 0
    baitLevel = 0
    scatterLevel = 0
    harpoonLevel = 0
    baitLevel = 0
    lineLevel = 0
    portalLevel = 0;
    weightLevel = 0
}