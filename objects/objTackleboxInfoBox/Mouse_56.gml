/// @description Insert description here
// You can write your code in this editor

var clicked = getClicked()

if (clicked != undefined) {
    oldActive = active
    active = clicked
    oldActive = oldActive ?? active // for first oldActive comparison it shouldn't ever be undefined
} else {
    active = undefined
}
function getClicked() {
    with (_objUpgradeParent) {
        if position_meeting(mouse_x, mouse_y, self) {
            return self
        }
    }
    return undefined
}