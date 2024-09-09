// Make the player follow the mouse position
//x += (mouse_x - x) * 0.05;
//y += (mouse_y - y) * 0.05;
//if slowed==true {
//	x = mouse_x*0.5;
//	y=mouse_y*0.5
//}
//else{
//x = mouse_x;
//y = mouse_y;
//}
// Define the speed for interpolation
var move_speed = slowed ? 0.05 : 1;

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
// Check left boundary
if x < border_left {
    x = border_left;
}

// Check right boundary
if x > border_right {
    x = border_right;
}

// Check top boundary
if y < border_top {
    y = border_top;
}

// Check bottom boundary
if y > border_bottom {
    y = border_bottom;
}

if keyboard_check_pressed(vk_escape)
{
    game_end();
}

// Decrease the fire timer
fire_timer -= delta_time / 1000; // Convert milliseconds to seconds
//fire automatically
if fire_timer<=0{
	if(O_game.rock_destroyed<150){
	instance_create_layer(x,y, "Instances",O_bullet);
	}else{
		instance_create_layer(x-15,y, "Instances",O_bullet);
		instance_create_layer(x+15,y, "Instances",O_bullet);
	}
	if(slowed==true){
		fire_timer=fire_delay*1.2;
	}else{
	fire_timer = fire_delay;
	}
	var min_pitch = 1.0; // Minimum pitch
	var max_pitch = 1.2; // Maximum pitch

	// Generate a random pitch within the specified range
	var random_pitch = random_range(min_pitch, max_pitch);

	// Set the pitch for the sound
	audio_sound_pitch(Pewpew, random_pitch);

	// Play the sound with the adjusted pitch
	audio_play_sound(Pewpew, 10, false);
    }

if mouse_check_button(mb_right) && shield_cooldown==false{
	if(O_game.rock_destroyed<200){
	alarm[1]=150;
	collision_enabled=false;
	shield_cooldown=true;
	instance_create_layer(x,y,"Instances",O_shield);
	}else{
	alarm[1]=300;
	collision_enabled=false;
	shield_cooldown=true;
	instance_create_layer(x,y,"Instances",O_shield);
	}

}

// Flicker effect
if (flicker) {
    flicker_timer += 1;
    
    if (flicker_timer >= flicker_interval) {
        flicker_timer = 0; // Reset timer
        
        // Toggle the visibility of the sprite
        if (image_alpha == 1) {
            image_alpha = 0; // Make invisible
        } else {
            image_alpha = 1; // Make visible
        }
    }
}

// Check alarm
if (alarm[0] == 0) {
    // End flicker and re-enable collision
    flicker = false;
    collision_enabled = true;
}
