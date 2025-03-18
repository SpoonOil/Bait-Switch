/// @description Insert description here
// You can write your code in this editor
var scrolling = false
var scrollCutoff = 20
if (oldoldX == undefined) oldoldX = 1;
if (abs(mouse_x - oldoldX) > scrollCutoff || (leftTime > 30)) {
    scrolling = true;
}
var _target = getSelected(mouse_x, mouse_y, selects)

if (_target != -1 && !scrolling) {
    selectedIndex = _target
    targetSelect = selects[_target-1]
    selectCenter = (targetSelect[0] + targetSelect[1])/2
    targetOffset = offset - (selectCenter - room_width/2)
    var _currentCostume = costumes[_target-1]
    if (_currentCostume.owned == true) {
        global.selectedSprite = costumes[selectedIndex-1].sprite
    } else if (!_currentCostume.locked && selectedCostume == _currentCostume) {
        buyCostume(_currentCostume)
    }
    
    selectedCostume = _currentCostume
}
oldoldX = undefined 
leftTime = 0