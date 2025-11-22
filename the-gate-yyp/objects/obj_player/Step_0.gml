var goto_trig = mouse_check_button_pressed(mb_left);

if goto_trig{
	if !walk_setup{
		walk_setup=1;
		point_direction(x,y,mouse_x,mouse_y)
		goto_x=round(mouse_x);
		goto_y=round(mouse_y);
		prev_x=x;
		prev_y=y;
	}
}

if walk_setup{
	x=round(x);
	y=round(y);
	
	move_towards_point(goto_x,goto_y,walk_spd);
	
	show_debug_message(point_distance(x,y,goto_x,goto_y))
	if point_distance(x,y,goto_x,goto_y)<10{
		walk_setup=0;
		speed=0;
	}
}