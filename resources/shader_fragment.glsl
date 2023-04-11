#version 330 core
out vec3 color;
in vec3 vertex_normal;
in vec3 vertex_pos;
in vec2 vertex_tex;
uniform vec3 campos;

uniform sampler2D tex;
uniform sampler2D tex2;
uniform sampler2D tex3;

void main()
{
vec3 n = normalize(vertex_normal);
vec3 lp=vec3(100,100,100);
vec3 ld = normalize(lp - vertex_pos);
float diffuse = dot(ld,n);
diffuse = clamp(diffuse,0.15,1);

color = texture(tex, vertex_tex).rgb;
vec3 color3 = texture(tex3, vertex_tex).rgb;

vec3 color2 = texture(tex2, vertex_tex).rgb;

vec3 cd = normalize(vertex_pos - campos);
vec3 h = normalize(cd+ld);
float spec = dot(n, h);
spec = clamp(spec,0,1);
spec = pow(spec,20);

color = diffuse * color + diffuse * color3;

color += vec3(1,1,1) * spec * color2 * 0.6;

// color earth
// color2 spec light
// color3 cloud in png

}
