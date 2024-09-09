// Make the player follow the mouse position
//x += (mouse_x - x) * 0.05;
//y += (mouse_y - y) * 0.05;
x = mouse_x;
y = mouse_y;

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


// Use "A" and "D" keys to rotate the player
//if keyboard_check(ord("D"))
//{
//    image_angle -= 4; // Rotate counterclockwise
//}
//if keyboard_check(ord("A"))
//{
//    image_angle += 4; // Rotate clockwise
//}

// Decrease the fire timer
fire_timer -= delta_time / 1000; // Convert milliseconds to seconds

// Check if the left mouse button is pressed and the timer allows firing
//if mouse_check_button(mb_left) {
//    if fire_timer <= 0 {
//        // Fire a bullet
//        instance_create_layer(x, y, "Instances", O_bullet);

//        // Reset the fire timer
//        fire_timer = fire_delay;
//		var min_pitch = 1.0; // Minimum pitch
//		var max_pitch = 1.2; // Maximum pitch

//		// Generate a random pitch within the specified range
//		var random_pitch = random_range(min_pitch, max_pitch);

//		// Set the pitch for the sound
//		audio_sound_pitch(Pewpew, random_pitch);

//		// Play the sound with the adjusted pitch
//		audio_play_sound(Pewpew, 10, false);
//    }
//}
//fire automatically
if fire_timer<=0{
	if(O_game.rock_destroyed<100){
	instance_create_layer(x,y, "Instances",O_bullet);
	}else{
		instance_create_layer(x-15,y, "Instances",O_bullet);
		instance_create_layer(x+15,y, "Instances",O_bullet);
	}
		
	fire_timer = fire_delay;
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
	alarm[1]=300;
	collision_enabled=false;
	shield_cooldown=true;
	instance_create_layer(x,y,"Instances",O_shield);
	}else{
	alarm[1]=450;
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
