//set temp var for the select action (left mouse button)
var select = mouse_check_button_pressed(mb_left);
var _plr_dist=0;
with global.intfocus{
	_plr_dist = distance_to_object(obj_player);
}
plr_dist = _plr_dist;

//if mouse is hovering over instance
if position_meeting(mouse_x,mouse_y,id){
	//make instance larger
	image_xscale=1.7
	image_yscale=1.7
	//if left mouse button is clicked
	if select{
		if plr_dist<20 xor obj_game_manager.plrstate==1{
			int_exec();
			instance_destroy();
		} else {
			obj_player.walk_auto=global.intfocus;
			player_approach=true;
		}
	}
} else{
	//if mouse is not hovering over instance, return to normal size.
	image_xscale=1.5
	image_yscale=1.5
}
if select && !player_approach{
	//destroy all text
	instance_destroy();
}

if player_approach{
	if plr_dist<20{
		instance_destroy();
		
		int_exec();
		
		with obj_player{
			walk_auto=noone;
			path_end();
		}
		
		player_approach=false;
	}
}