#version 330 core

layout (location = 0) in vec3 in_position; // Position of each vertex

layout (std140) uniform UBO {
    mat4  m_proj;  // A 4x4 matrix for projection transformation
    vec3  u_center; // A 3D vector representing the center point around which the rotation occurs
    float rot_speed; // Represente the rotation speed
    mat4  m_view; // A 4x4 matrix for view transformation
    vec3  cam_pos; // Represente the camera position
    float u_time; //The current time, used to control the animation
};

// Rotation Function
mat2 rot(float a) {
    float sa = sin(a);  
    float ca = cos(a);
    return mat2(ca, -sa, sa, ca);
}

// Rotate World Function
vec3 rotate_world(vec3 in_position) {
    vec3 v_position = in_position;

    v_position -= u_center;
    v_position.xz *= rot(u_time * rot_speed);
    v_position += u_center;

    return v_position;
}

// Transforms the rotated position by multiplying it with the projection matrix and the view matrix.
void main() {
    vec3 v_position = rotate_world(in_position);

    gl_Position = m_proj * m_view * vec4(v_position, 1.0);
}