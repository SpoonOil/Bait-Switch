/// @description Insert description here
// You can write your code in this editor
//SparkleParticle
interval = random_range(2, 4)

color1 = $FF2200 // Blue
color2 = $FF7621
color3 = $FFBF3F

activeParticleTypes = []
_ps = part_system_create();
part_system_draw_order(_ps, true);
