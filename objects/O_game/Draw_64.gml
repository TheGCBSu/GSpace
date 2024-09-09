//draw_text(10, 10, "Score:"+ string(rock_destroyed));
draw_text_transformed(10,10,"Score:"+string(rock_destroyed),2,2,0);
//draw_text_transformed(10,900,"A,D to rotate",2,2,0);
//draw_text_transformed(10,875,"Mouse to move",2,2,0);
draw_text_transformed(10,875,"RMB to Activate Shield",2,2,0);
draw_text_transformed(10,900,"Mouse to move",2,2,0);
//draw_text_transformed(10,850,"LMB to shoot",2,2,0);
draw_text_transformed(10,925,"ESC to exit",2,2,0);

if(instance_find(O_player,0)){
draw_text_transformed(850,10,"Health:"+string(O_player.player_hp),2,2,0);
}else{
	draw_text_transformed(850,10,"Health:0",2,2,0);
}
