precision mediump float;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec2 texelSize;
uniform vec4 outlineColor;
uniform float thickness;

void main()
{
vec4 original = texture2D(gm_BaseTexture, v_vTexcoord);
float outline = 0.0;

// Use unrolled loops or fixed sampling pattern instead of dynamic loops
// Sample in 8 directions at specified thickness
vec2 offsets[8];
offsets[0] = vec2(-thickness * texelSize.x, -thickness * texelSize.y); // top-left
offsets[1] = vec2(0.0, -thickness * texelSize.y);                      // top
offsets[2] = vec2(thickness * texelSize.x, -thickness * texelSize.y);  // top-right
offsets[3] = vec2(-thickness * texelSize.x, 0.0);                      // left
offsets[4] = vec2(thickness * texelSize.x, 0.0);                       // right
offsets[5] = vec2(-thickness * texelSize.x, thickness * texelSize.y);  // bottom-left
offsets[6] = vec2(0.0, thickness * texelSize.y);                       // bottom
offsets[7] = vec2(thickness * texelSize.x, thickness * texelSize.y);   // bottom-right

for(int i = 0; i < 8; i++) {
    vec4 neighbor = texture2D(gm_BaseTexture, v_vTexcoord + offsets[i]);
    if(original.a < 0.1 && neighbor.a > 0.1) {
        outline = 1.0;
        break;
    }
}

gl_FragColor = mix(original, outlineColor, outline) * v_vColour;
}
