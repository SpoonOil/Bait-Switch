/// @description Insert description here
// You can write your code in this editor
//SparkleParticle
interval = random_range(2, 4)

color1 = $00A5FF // Yellow
color2 = $0CC2FF
color3 = $1EE1FF

activeParticleTypes = []
_ps = part_system_create();
part_system_draw_order(_ps, true);

