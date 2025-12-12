cam_x = camera_get_view_x(view_camera[0]);
cam_y = camera_get_view_y(view_camera[0]);

cam=0;
img=0;
snd=0;

col=c_grey

switch sprite_index{
	case spr_switch_cam:
		inst = 0;
		x = cam_x + 30;
		y = cam_y + 170;
	break;
	case spr_switch_img:
		inst = 1;
		x = cam_x + 130;
		y = cam_y + 170;
	break;
	case spr_switch_snd:
		inst = 2;
		x = cam_x + 230;
		y = cam_y + 170;
	break;
}

show_debug_message("switchboard instance init {0}, at {1},{2}", sprite_index,x,y);