/// @description Insert description here
// You can write your code in this editor
if (keyboard_check(vk_anykey)) {
    
    var new_key = string_upper(keyboard_lastchar);
    
    if (new_key != "" && ord(new_key) >= 32) { 
        key = new_key;
    }
}

var _valid_keys = [
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", 
    "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", 
    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
];

if (array_contains(_valid_keys, key) && !keyboard_check(vk_backspace) && active && string_length(codeText) < 8) {
    lastChar = currentChar
    currentChar = keyboard_lastchar
    if (codeText == defaultText) {
        codeText = ""
    } else if (codeText == "INVALID!" || codeText == "SUCCESS!" || (cooldown >=0 && lastChar == currentChar)) {
        
    } else {
        cooldown = baseCooldown
        codeText+=string_upper(keyboard_lastchar) 
    }
}
key = undefined
cooldown--;