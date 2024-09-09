if(collision_enabled){
player_hp = player_hp-1;

if(player_hp<=0){
	with (O_bullet) {
            instance_destroy();
        }
	with(O_shield){
		instance_destroy();
	}
	effect_create_above(ef_firework, x, y, 1, c_white);
	instance_destroy();
	audio_play_sound(Explosion, 10, false);
	O_game.alarm[0] = 100;
}
// Start the flicker effect
flicker = true;

// Disable collision and start alarm
collision_enabled = false;
alarm[0] = 30; // 30 steps = 0.5 seconds
}