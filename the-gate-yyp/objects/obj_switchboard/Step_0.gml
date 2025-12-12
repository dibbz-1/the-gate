if !instance_exists(obj_video_player_int){
	instance_destroy();
} else{

	var _event = "";

	with obj_video_player_int{
		if video_get_status() == video_status_paused {
		
			_event=event[next_event];
		
		}
	}

	col=c_grey;

	if inst==0{
		obj_video_player_int.cam = position_meeting(mouse_x,mouse_y,id) && mouse_check_button_pressed(mb_left);
		if _event=="cam" col=c_white;
	}
	if inst==1{
		obj_video_player_int.img = position_meeting(mouse_x,mouse_y,id) && mouse_check_button_pressed(mb_left);
		if _event=="img" col=c_white;
	}
	if inst==2{
		obj_video_player_int.snd = position_meeting(mouse_x,mouse_y,id) && mouse_check_button_pressed(mb_left);
		if _event=="snd" col=c_white;
	}
	
}