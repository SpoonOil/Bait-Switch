/// @description Insert description here
// You can write your code in this editor

var _height = 500
var _width = room_width
//draw_rectangle(x, y, x+_width, y+_height, true)

var _screenNodes = 5
var _nodes = totalCostumes
var _nodeWidth = (_width/_screenNodes)

for (var _i = 0; _i < _nodes; _i++) { 
    var _buffer = (_width/_screenNodes)/2
    var _lowerbound = _width - (_nodeWidth*_nodes) - _buffer
    var _upperbound = x + _buffer + (_nodeWidth*_nodes)
    var _costume = costumes[_i]
    var _textOffset = 150
    
    var _x = x + offset + _buffer + _nodeWidth*_i
    while (_x > _width) {
        _x -= (_nodeWidth*_nodes)
    } 
    //
    while (_x < x-_nodeWidth ) {
        _x += (_nodeWidth*_nodes)
    }
    
    var _y = y+_height / 4
    var _scaling = 1 - (point_distance(x+_width/2, _y, _x, _y)/640 - 0.025)
    if (_scaling > 1) {
        _scaling = 1
    }

    draw_set_halign(fa_center)
    draw_set_font(fontCostumes)
    
    var focusedThreshold = 100
    var _focused = abs(_x - room_width/2) < focusedThreshold
    
    if (_costume.owned) {
        
        if (_costume.sprite == global.selectedSprite) {
            
            var u_texelSize = shader_get_uniform(shdTest, "texelSize");
            var u_outlineColor = shader_get_uniform(shdTest, "outlineColor");
            var u_thickness = shader_get_uniform(shdTest, "thickness");
            shader_set(shdTest)
            
            var tex = sprite_get_texture(sprite_index, image_index);
            shader_set_uniform_f(u_texelSize, texture_get_texel_width(tex), texture_get_texel_height(tex));
            shader_set_uniform_f(u_outlineColor, 1.0, 1.0, 1.0, 1.0);
            shader_set_uniform_f(u_thickness, 5.0);
        }
        
        draw_sprite_ext(_costume.sprite, 0, _x, _y+30, _scaling, _scaling, 0, c_white, 1)
        
        shader_reset()
        
        draw_text_transformed(_x, _y+_textOffset, _costume.name, _scaling, _scaling, 0)
        if (_focused) {
                scribble(_costume.flavorText).starting_format("fontCostumes", c_white).align(fa_center, fa_middle).scale(_scaling/1.5).draw(_x, _y+_textOffset+10+string_height("???")*_scaling)
        }
        


    } else if (_costume.owned == false) {   
        
        // sillouette
        draw_sprite_ext(_costume.sprite, 0, _x, _y+30, _scaling, _scaling, 0, c_black, 1)
        if (_costume.name == "Da Discreet" || _costume.name == "Da Silly Willy") {
            draw_sprite_ext(sprDefaultFish, 0, _x, _y+30, _scaling, _scaling, 0, c_black, 1)
        }
        
        // lock sprite
        if (_costume.locked) {
            draw_sprite_ext(sprMiniLock, 0, _x+15*_scaling, _y+30, _scaling, _scaling, 0, c_white, 1)
            draw_text_transformed_color(_x, _y+_textOffset, "???", _scaling, _scaling, 0, c_black, c_black, c_black, c_black, 1)
            
            if (_focused) {
                scribble(_costume.lockedText).starting_format("fontCostumes", c_white).align(fa_center, fa_middle).scale(_scaling/1.5).draw(_x, _y+_textOffset+10+string_height("???")*_scaling)
            }
            
        }  else {
            draw_text_transformed_color(_x, _y+_textOffset, _costume.name, _scaling, _scaling, 0, c_black, c_black, c_black, c_black, 1)
            
            if (_focused) {
                var costumeString = string(_costume.price)
                
                if (_costume.cashPay) {
                    costumeString = "[scale,0.4][sprRefDollar,0][/]"+costumeString
                } else {
                    costumeString = "[scale,0.75][sprRefStar,0][/] "+costumeString
                }
                
                
                scribble(costumeString).starting_format("fontCostumes", c_white).align(fa_center, fa_middle).scale(_scaling/1.5).draw(_x, _y+_textOffset+10+string_height("???")*_scaling)
            } 
        }
        

    }
    
    renderCostumeInfo(_costume, _x, _y, _scaling)
    draw_set_halign(fa_left)
}

function renderCostumeInfo(costume, x, y, scaling) {
    locked = costume.locked
    owned = costume.owned
    price = costume.price
}
//render select boxes

if (array_length(selects) > 0 && debugRender) {
    var _selectHeight = _height;
    for (var _i = 0; _i < array_length(selects); _i++) {
        debugRenderSelect(selects[_i][0], selects[_i][1], _selectHeight, selects[_i][2])
    }
}

function debugRenderSelect(x1, x2, height, num) {
    draw_rectangle(x1, y, x2, y+height, true )
}


