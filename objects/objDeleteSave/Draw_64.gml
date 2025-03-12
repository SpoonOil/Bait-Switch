/// @description Insert description here
// You can write your code in this editor
if (timer > 0 && hover) {
    var points = maxTimer; //Total number of points on the circle to calculate. Used max stamina value in this case.
    var centerX = x-60; //X coordinate for the center of the circle
    var centerY = y+17; //Y coordinate for the center of the circle
    var radius = 16; //Radius of the circle
    var slice = 2 * pi / points; //Calculates distance between points on the circle
    
    for(var i = 0; i < points; i++){ //loops through each point
       var angle = slice * i; //calculates angle based on slice size
       var newX = centerX + radius * cos(angle); //calculates new X coordinate of point on circle
       var newY = centerY + radius * sin(angle); //calculates new Y coordinate of point on circle
       if(i <= maxTimer - timer){ //draw only the parts of the circle that are equal to or below our remaining stamina
            draw_set_color(c_red)
            draw_circle(newX, newY,3,false); //draw a 3px radius circle at the calculated point
            draw_set_color(c_white)
       }
    }
}