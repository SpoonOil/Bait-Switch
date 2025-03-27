/// @description Insert description here
// You can write your code in this editor
_ps = part_system_create();
part_system_draw_order(_ps, true);


//circle
var _circleOut = part_type_create();
part_type_shape(_circleOut, pt_shape_sphere);
part_type_size(_circleOut, 0.05, 0.05, 0.015, 0);
part_type_scale(_circleOut, 1, 1);
part_type_speed(_circleOut, 0, 0, 0, 0);
part_type_direction(_circleOut, 80, 100, 0, 0);
part_type_gravity(_circleOut, 0, 270);
part_type_orientation(_circleOut, 181, 0, 0, 0, false);
part_type_colour3(_circleOut, color1, color2, color3);
part_type_alpha3(_circleOut, 1, 1, 1);
part_type_blend(_circleOut, false);
part_type_life(_circleOut, 20, 20);
array_push(activeParticleTypes, _circleOut)

var _circleIn = part_type_create();
part_type_shape(_circleIn, pt_shape_sphere);
part_type_size(_circleIn, 0.3, 0.3, -0.015, 0);
part_type_scale(_circleIn, 1, 1);
part_type_speed(_circleIn, 0, 0, 0, 0);
part_type_direction(_circleIn, 80, 100, 0, 0);
part_type_gravity(_circleIn, 0, 270);
part_type_orientation(_circleIn, 181, 0, 0, 0, false);
part_type_colour3(_circleIn, color3, color2, color1);
part_type_alpha3(_circleIn, 1, 1, 1);
part_type_blend(_circleIn, false);
part_type_life(_circleIn, 20, 20);
part_type_death(_circleOut, 1, _circleIn);
array_push(activeParticleTypes, _circleIn)

var _circleEmitter = part_emitter_create(_ps);
part_emitter_region(_ps, _circleEmitter, 0, 0, 0, 0, ps_shape_rectangle, ps_distr_linear);
part_emitter_stream(_ps, _circleEmitter, _circleOut, 2);
part_emitter_interval(_ps, _circleEmitter, interval, interval, time_source_units_seconds);

//lines
var _linesOut = part_type_create();
part_type_sprite(_linesOut, sprSparkle, false, true, false)
part_type_size(_linesOut, 0.1, 0.1, 0.04, 0);
part_type_scale(_linesOut, 1, 1);
part_type_speed(_linesOut, 0, 0, 0, 0);
part_type_direction(_linesOut, 80, 100, 0, 0);
part_type_gravity(_linesOut, 0, 270);
part_type_orientation(_linesOut, 0, 0, 2, 0, false);
part_type_colour3(_linesOut, color1, color2, color2);
part_type_alpha3(_linesOut, 1, 1, 1);
part_type_blend(_linesOut, false);
part_type_life(_linesOut, 20, 20);
array_push(activeParticleTypes, _linesOut)

var _linesIn = part_type_create();
part_type_sprite(_linesIn, sprSparkle, false, true, false)
part_type_size(_linesIn, 0.9, 0.9, -0.04, 0);
part_type_scale(_linesIn, 1, 1);
part_type_speed(_linesIn, 0, 0, 0, 0);
part_type_direction(_linesIn, 80, 100, 0, 0);
part_type_gravity(_linesIn, 0, 270);
part_type_orientation(_linesIn, 40, 40, 2, 0, false);
part_type_colour3(_linesIn, color3, color2, color1);
part_type_alpha3(_linesIn, 1, 1, 1);
part_type_blend(_linesIn, false);
part_type_life(_linesIn, 20, 20);
part_type_death(_linesOut, 1, _linesIn);
array_push(activeParticleTypes, _linesIn)

var _linesEmitter = part_emitter_create(_ps);
part_emitter_region(_ps, _linesEmitter, 0, 0, 0, 0, ps_shape_rectangle, ps_distr_linear);
part_emitter_stream(_ps, _linesEmitter, _linesOut, 1);
part_emitter_interval(_ps, _linesEmitter, interval, interval, time_source_units_seconds);

part_system_position(_ps, x, y);
