/// @description Insert description here
// You can write your code in this editor
var move_speed = O_player.slowed ? 0.05 : 1;

// Calculate the distance and direction to the mouse
var target_x = mouse_x;
var target_y = mouse_y;
var direction1 = point_direction(x, y, target_x, target_y);
var distance = point_distance(x, y, target_x, target_y);

// Calculate the step size based on the move_speed
var step_size = move_speed * distance;

// Move the player smoothly towards the mouse position
x += lengthdir_x(step_size, direction1);
y += lengthdir_y(step_size, direction1);