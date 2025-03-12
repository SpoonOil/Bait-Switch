/// @description Insert description here
// You can write your code in this editor

var filename = "testSave.dat"
var str = json_encode(global)

var buffer = buffer_create(string_byte_length(str)+1, buffer_fixed, 1)
buffer_write(buffer, buffer_string, str)
buffer_save(buffer, filename)
buffer_delete(buffer)