//declare temp variables for player input
var goto_trig = mouse_check_button_pressed(mb_left);

// if mouse left button clicked, set walk setup to true and set variables to mouse coords
if goto_trig{
	if !walk_setup && !instance_exists(obj_textbox) && !position_meeting(mouse_x,mouse_y,obj_col) or position_meeting(mouse_x,mouse_y,obj_door) && obj_game_manager.plrstate==0{
		walk_setup=1;
		
		path = path_add();
		if mp_grid_path(obj_game_manager.grid,path,x,y,mouse_x,mouse_y,true){
			path_set_kind(path,1);
			
			path_start(path,walk_spd,path_action_stop,true);
		}
		else{
			walk_setup=0;
		}
	}
}



//if walk setup is true, move towards point.
//if walk_setup{
//	move_towards_point(goto_x,goto_y,walk_spd);
	
//	//if player coords are nearing the destination, cancel movement and allow player to move again.
//	if point_distance(x,y,goto_x,goto_y)<10{
//		walk_setup=0;
//		speed=0;
//	}
//}

