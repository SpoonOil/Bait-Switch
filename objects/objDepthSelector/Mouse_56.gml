/// @description Insert description here
// You can write your code in this editor

var selection = getSelection()

if (selection >= 0 ) {
       updateDepth(selection)
}

function updateDepth(depth) {
    global.line = depth
    currentDepth = depth
}

function getSelection() {
    for (var i = 0; i < mapAmount; i++) {
        var leftBound = x + arrowOffset
        var topBound = top + titleHeight + (rowHeight*i)
        var rightBound = x + arrowOffset + width
        var botBound = top + titleHeight + (rowHeight*(i+1))
        if (
            mouse_x > leftBound &&
            mouse_x < rightBound &&
            mouse_y > topBound &&
            mouse_y < botBound
        ) {
            return i
        }
    }
    
    return -1
}