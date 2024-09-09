/// @description Insert description here
// You can write your code in this editor
var min_pitch = 0.5; // Minimum pitch
var max_pitch = 1.5; // Maximum pitch

// Generate a random pitch within the specified range
var random_pitch = random_range(min_pitch, max_pitch);

// Set the pitch for the sound
audio_sound_pitch(Explosion, random_pitch);

// Play the sound with the adjusted pitch
audio_play_sound(Explosion, 10, false);
var distance = 50- floor(O_game.rock_destroyed/12);
if sprite_index == RockBigv2
{
	effect_create_above(ef_explosion, x, y, 2, c_white);
		instance_destroy();
        var offset_x1 = 50
		var offset_y1 = 50
		var offset_x2 = -50
		var offset_y2 = -50

		var rock1 = instance_create_layer(x + offset_x1, y + offset_y1, "Instances", O_rock);
		var rock2 = instance_create_layer(x + offset_x2, y + offset_y2, "Instances", O_rock);
		// Set their sprites to the small rock sprite
		rock1.sprite_index = RockSmallv2;
		rock2.sprite_index = RockSmallv2;

}
else if instance_number(O_rock) < O_game.max_rocks
{
	effect_create_above(ef_explosion, x, y, 1, c_white);
	var max_width = room_width+distance;
	var max_height = 0;
	var loc_x=random_range(room_width/2,max_width);
	var loc_y= random_range(room_height/2,max_height);
	//effect_create_above(ef_explosion, loc_x, room_height-10, 2, c_gray);
	instance_create_layer(loc_x,max_height, "Instances", O_rock);
    instance_destroy();
}
else
{
		effect_create_above(ef_explosion, x, y, 1, c_white);
        instance_destroy();
}

