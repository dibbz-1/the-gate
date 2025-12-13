draw_set_font(fnt_proto_med);
draw_set_halign(fa_left);
draw_text(10,10,plrstate);

// save and load graphics

if salpha>0{
	draw_text_colour(20,50,"SAVED...", c_white,c_white,c_white,c_white,salpha);
	salpha-=0.05;
}
if lalpha>0{
	draw_text_colour(20,50,"LOADED...", c_white,c_white,c_white,c_white,lalpha);
	lalpha-=0.05;
}

//debug
var intfocus = global.intfocus;
	
var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);
	
//find the instances position relative to its position on the gui.
var _inst_rel_x = (mouse_x-_cam_x)*3.125;
var _inst_rel_y = (mouse_y-_cam_y)*3.125;
	
if mouse_check_button_pressed(mb_middle){
	show_debug_message("{0},{1}",_inst_rel_x,_inst_rel_y);
	draw_sprite(spr_otherguy,0,_inst_rel_x,_inst_rel_y);
}