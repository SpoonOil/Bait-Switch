// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @desc Saves a string to a filename of choice
/// @param {string} filename filename before ".dat"
/// @param {string} str string to save
function saveStringToFile(filename, str) {
    var buffer = buffer_create(string_byte_length(str) + 1, buffer_fixed, 1)
    buffer_write(buffer, buffer_string, str)
    buffer_save(buffer, filename + ".dat")
    buffer_delete(buffer)
}