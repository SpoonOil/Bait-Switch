/// @description Insert description here
// You can write your code in this editor

_ps = part_system_create();
part_system_draw_order(_ps, true);
//circle
var _ptype1 = part_type_create();
part_type_shape(_ptype1, pt_shape_sphere);
part_type_size(_ptype1, 0.05, 0.05, 0.015, 0);
part_type_scale(_ptype1, 1, 1);
part_type_speed(_ptype1, 0, 0, 0, 0);
part_type_direction(_ptype1, 80, 100, 0, 0);
part_type_gravity(_ptype1, 0, 270);
part_type_orientation(_ptype1, 181, 0, 0, 0, false);
part_type_colour3(_ptype1, $FF2200, $FF7621, $FFBF3F);
part_type_alpha3(_ptype1, 1, 1, 1);
part_type_blend(_ptype1, false);
part_type_life(_ptype1, 20, 20);
array_push(activeParticleTypes, _ptype1)


var _ptype2 = part_type_create();
part_type_shape(_ptype2, pt_shape_sphere);
part_type_size(_ptype2, 0.3, 0.3, -0.015, 0);
part_type_scale(_ptype2, 1, 1);
part_type_speed(_ptype2, 0, 0, 0, 0);
part_type_direction(_ptype2, 80, 100, 0, 0);
part_type_gravity(_ptype2, 0, 270);
part_type_orientation(_ptype2, 181, 0, 0, 0, false);
part_type_colour3(_ptype2, $FFBF3F, $FF7621, $FF2200);
part_type_alpha3(_ptype2, 1, 1, 1);
part_type_blend(_ptype2, false);
part_type_life(_ptype2, 20, 20);
part_type_death(_ptype1, 1, _ptype2);
array_push(activeParticleTypes, _ptype2)

var _pemit1 = part_emitter_create(_ps);
part_emitter_region(_ps, _pemit1, 0, 0, 0, 0, ps_shape_rectangle, ps_distr_linear);
part_emitter_stream(_ps, _pemit1, _ptype1, 2);
part_emitter_interval(_ps, _pemit1, interval, interval, time_source_units_seconds);

//lines
var _ptype3 = part_type_create();
part_type_sprite(_ptype3, sprSparkle, false, true, false)
part_type_size(_ptype3, 0.1, 0.1, 0.04, 0);
part_type_scale(_ptype3, 1, 1);
part_type_speed(_ptype3, 0, 0, 0, 0);
part_type_direction(_ptype3, 80, 100, 0, 0);
part_type_gravity(_ptype3, 0, 270);
part_type_orientation(_ptype3, 0, 0, 2, 0, false);
part_type_colour3(_ptype3, $FF2200, $FF7621, $FFBF3F);
part_type_alpha3(_ptype3, 1, 1, 1);
part_type_blend(_ptype3, false);
part_type_life(_ptype3, 20, 20);
array_push(activeParticleTypes, _ptype3)

var _ptype4 = part_type_create();
part_type_sprite(_ptype4, sprSparkle, false, true, false)
part_type_size(_ptype4, 0.9, 0.9, -0.04, 0);
part_type_scale(_ptype4, 1, 1);
part_type_speed(_ptype4, 0, 0, 0, 0);
part_type_direction(_ptype4, 80, 100, 0, 0);
part_type_gravity(_ptype4, 0, 270);
part_type_orientation(_ptype4, 40, 40, 2, 0, false);
part_type_colour3(_ptype4, $FFBF3F, $FF7621, $FF2200);
part_type_alpha3(_ptype4, 1, 1, 1);
part_type_blend(_ptype4, false);
part_type_life(_ptype4, 20, 20);
part_type_death(_ptype3, 1, _ptype4);
array_push(activeParticleTypes, _ptype4)

var _pemit2 = part_emitter_create(_ps);
part_emitter_region(_ps, _pemit2, 0, 0, 0, 0, ps_shape_rectangle, ps_distr_linear);
part_emitter_stream(_ps, _pemit2, _ptype3, 1);
part_emitter_interval(_ps, _pemit2, interval, interval, time_source_units_seconds);

part_system_position(_ps, x, y);