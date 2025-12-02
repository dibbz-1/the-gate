//declare temp variables for player input
var goto_trig = mouse_check_button_pressed(mb_left);

// if mouse left button clicked, set walk setup to true and set variables to mouse coords
if goto_trig{
	if !walk_setup && !instance_exists(obj_textbox) && !place_meeting(mouse_x,mouse_y,obj_col){
		walk_setup=1;
		point_direction(x,y,mouse_x,mouse_y)
		goto_x=round(mouse_x);
		goto_y=round(mouse_y);
	}
}

//if walk setup is true, move towards point.
if walk_setup{
	move_towards_point(goto_x,goto_y,walk_spd);
	
	//if player coords are nearing the destination, cancel movement and allow player to move again.
	if point_distance(x,y,goto_x,goto_y)<10{
		walk_setup=0;
		speed=0;
	}
}

if (speed>0){
	sprite_index=spr_traci_walkD;
}
else{
	sprite_index=spr_traci_idle_d;
}

depth=y*-1;