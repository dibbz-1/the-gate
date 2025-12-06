var _video_dat = video_draw();
var _video_stat = _video_dat[0];

var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);

if _video_stat == 0 {
	draw_surface(_video_dat[1], _cam_x,_cam_y);
}

draw_rectangle_colour(_cam_x,_cam_y,_cam_x+320,_cam_y+30,c_black,c_black,c_black,c_black,false);
draw_rectangle_colour(_cam_x,_cam_y+200,_cam_x+320,_cam_y+240,c_black,c_black,c_black,c_black,false);

if video_get_status()==video_status_closed{
	instance_destroy();
}