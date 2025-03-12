/// @description 

var _direction = point_direction(x, y, x + vx, y + vy)
if (_direction > 90 && _direction < 270) {
    image_yscale = -0.3
} else {
    image_yscale = 0.3
}

draw_self()