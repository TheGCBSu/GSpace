if(collision_enabled){
	if(other.image_blend!=c_green){
		if(other.image_blend==c_red){
			player_hp=player_hp-floor(O_game.rock_destroyed/100);
		}

player_hp = player_hp-1;
audio_play_sound(Player_hit,10,0);

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
alarm[0] = 90; // 30 steps = 0.5 seconds
	}
	else{
		if(slowed!=true){
		slowed=true;
		alarm[3]=150+O_game.rock_destroyed/12;
		}
	}
}