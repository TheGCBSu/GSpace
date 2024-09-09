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
if(sprite_index==RockSmallv2 && image_blend==c_red){
O_game.rock_destroyed+=4;
}
O_game.rock_destroyed+=1;
if (O_game.rock_destroyed % 12 == 0) {
    // Increase the number of rocks every 3 rocks destroyed
    O_game.max_rocks += 1;
}
var rock_speed_increase = floor(O_game.rock_destroyed / 3) * 0.5; // Adjust speed increment as needed
speed = 1 + rock_speed_increase;
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
		var randomizer = irandom_range(1,100);
		if(randomizer>90){
			var offset_x3 = 100
			var offset_y3 = 100
			var rock3=instance_create_layer(x+offset_x3,y+offset_y3, "Instances", O_rock);
			rock3.sprite_index=RockSmallv2;
			rock3.image_blend=c_red;
			rock3.speed=max(speed*1.5,2);
		}
		else if(randomizer>40){
			var offset_x3 = 100
			var offset_y3 = 100
			var rock3=instance_create_layer(x+offset_x3,y+offset_y3, "Instances", O_rock);
			rock3.sprite_index=RockSmallv2;
			rock3.image_blend=c_green;
			rock3.speed=speed*1.5;
		}
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

// Find the player object
var player = instance_find(O_player, 0); // Assumes only one player instance

// Check if the player object exists
if (player != undefined) {
	if(O_game.rock_destroyed%100==0){
		player.player_hp+=1;
	}
    // Update the fire delay in the player object
	var fire_decrease=O_game.rock_destroyed*0.05
    player.fire_delay = max(50,300-floor(fire_decrease)) ; // Set the new fire delay
}
