shader_type spatial;

uniform sampler2D texture_albedo;
uniform vec2 uv_scale = vec2(20, 20);

void fragment() {
    vec2 uv = UV * uv_scale;
    vec4 tex_color = texture(texture_albedo, uv);
    ALBEDO = tex_color.rgb;
}