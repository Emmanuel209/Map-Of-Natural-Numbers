#version 330 core

// Declare the output variable for the fragment shader
layout (location = 0) out vec4 fragColor;


void main() {
    // Set the output color to a medium gray with full opacity
    fragColor = vec4(vec3(0.5), 1.0);
}