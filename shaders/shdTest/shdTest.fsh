varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 texelSize;
uniform vec4 outlineColor;  // Add outline color as uniform
uniform float thickness;    // Add thickness as uniform

void main()
{
    vec4 original = texture2D(gm_BaseTexture, v_vTexcoord);
    float outline = 0.0;
    
    // Check in more directions for thicker outline
    for(float x = -thickness; x <= thickness; x++) {
        for(float y = -thickness; y <= thickness; y++) {
            if(x == 0.0 && y == 0.0) continue;
            
            vec2 offset = vec2(x * texelSize.x, y * texelSize.y);
            vec4 neighbor = texture2D(gm_BaseTexture, v_vTexcoord + offset);
            
            if(original.a < 0.1 && neighbor.a > 0.1) {
                outline = 1.0;
                break;
            }
        }
    }
    
    gl_FragColor = mix(original, outlineColor, outline) * v_vColour;
}