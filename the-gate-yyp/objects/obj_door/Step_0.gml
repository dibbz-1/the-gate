if position_meeting(mouse_x,mouse_y,id) && distance_to_object(obj_player)==0{
	if mouse_check_button_pressed(mb_left){
		rm_fade(targ_x,targ_y,targ_rm,15,c_black);
		show_debug_message("room transition init");
	}
}
