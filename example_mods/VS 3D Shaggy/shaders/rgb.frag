#pragma header

// baked palette colors
const vec3 r = vec3(0.2431, 0.2431, 0.2510);
const vec3 g = vec3(0.9333, 0.9216, 0.2824);
const vec3 b = vec3(0.6275, 0.6275, 0.6431);

uniform float mult;

vec4 flixel_texture2DCustom(sampler2D bitmap, vec2 coord)
{
    vec4 color = flixel_texture2D(bitmap, coord);

    if (!hasTransform)
        return color;

    if (color.a <= 0.0 || mult <= 0.0)
        return color * openfl_Alphav;

    vec4 newColor = color;
    newColor.rgb = min(
        color.r * r +
        color.g * g +
        color.b * b,
        vec3(1.0)
    );
    newColor.a = color.a;

    color = mix(color, newColor, mult);

    if (color.a > 0.0)
        return vec4(color.rgb, color.a);

    return vec4(0.0);
}

void main()
{
    gl_FragColor = flixel_texture2DCustom(bitmap, openfl_TextureCoordv);
}
