/// @description Insert description here
// You can write your code in this editor

activeParticleTypes = []
emitters = []

//MovingBubbles


function createDashParticles(x, y, dir) {
    
    var dashParts = part_system_create();
    part_system_draw_order(dashParts, true); 


    var _ptype1 = part_type_create();
    part_type_shape(_ptype1, pt_shape_ring);
    part_type_size(_ptype1, 1, 1, 0, 0);
    part_type_scale(_ptype1, 0.25, 0.25);
    part_type_speed(_ptype1, 10, 20, -0.5, 0);
    
    var bubbleParticles = _ptype1
    
    if (array_contains(activeParticleTypes, bubbleParticles) == false) {
        array_push(activeParticleTypes, bubbleParticles)
    }
    
    var particleDirection = dir + 180
    part_type_direction(bubbleParticles, particleDirection-10, particleDirection+10, 0, 0);
    part_type_gravity(bubbleParticles, 0.6, 90);
    part_type_orientation(bubbleParticles, 0, 0, 0, 0, false);
    part_type_colour3(bubbleParticles, $FFA81C, $FFA81C, $FFD09E);
    part_type_alpha3(bubbleParticles, 1, 1, 0);
    part_type_blend(bubbleParticles, false);
    part_type_life(bubbleParticles, 80, 80);
    
    var _pemit1 = part_emitter_create(dashParts);
    part_emitter_region(dashParts, _pemit1, -50, 50, -50, 50, ps_shape_rectangle, ps_distr_linear);
    part_emitter_burst(dashParts, _pemit1, bubbleParticles, 20);
    part_emitter_delay(dashParts, _pemit1, 0, 20, time_source_units_frames)
    
    array_push(emitters, _pemit1)
    
    part_system_position(dashParts, x, y);
}

function initializeSwordBubbles() {
    
    var swordParts = part_system_create()
    part_system_draw_order(dashParts, true); 
    
}
function createSwordBubbles(x, y, dir) {
    
    var dashParts = part_system_create();
    part_system_draw_order(dashParts, true); 


    var _ptype1 = part_type_create();
    part_type_shape(_ptype1, pt_shape_ring);
    part_type_size(_ptype1, 1, 1, 0, 0);
    part_type_scale(_ptype1, 0.25, 0.25);
    part_type_speed(_ptype1, 10, 20, -0.5, 0);
    
    var bubbleParticles = _ptype1
    
    if (array_contains(activeParticleTypes, bubbleParticles) == false) {
        array_push(activeParticleTypes, bubbleParticles)
    }
    
    var particleDirection = dir + 180
    part_type_direction(bubbleParticles, particleDirection-10, particleDirection+10, 0, 0);
    part_type_gravity(bubbleParticles, 0.6, 90);
    part_type_orientation(bubbleParticles, 0, 0, 0, 0, false);
    part_type_colour3(bubbleParticles, $FFA81C, $FFA81C, $FFD09E);
    part_type_alpha3(bubbleParticles, 1, 1, 0);
    part_type_blend(bubbleParticles, false);
    part_type_life(bubbleParticles, 80, 80);
    
    var _pemit1 = part_emitter_create(dashParts);
    part_emitter_region(dashParts, _pemit1, -50, 50, -50, 50, ps_shape_rectangle, ps_distr_linear);
    part_emitter_burst(dashParts, _pemit1, bubbleParticles, 20);
    part_emitter_delay(dashParts, _pemit1, 0, 20, time_source_units_frames)
    
    array_push(emitters, _pemit1)
    
    part_system_position(dashParts, x, y);
}

