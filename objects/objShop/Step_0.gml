/// @description Insert description here
// You can write your code in this editor

totalCostumes = array_length(costumes)

selects = calculateSelectTargets()

if (targetOffset < offset - selectSpeed) {
    offset -= selectSpeed
} else if (targetOffset > offset + selectSpeed) {
    offset += selectSpeed
}