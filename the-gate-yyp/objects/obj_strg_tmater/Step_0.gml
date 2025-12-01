var select=mouse_check_button_pressed(mb_left);

if position_meeting(mouse_x,mouse_y,id){
	image_xscale = 2;
	image_yscale = 2;
	
	if select{
		global.inhand=label;
		instance_destroy();
	}
}else{
	image_xscale = 1.5;
	image_yscale = 1.5;
}
if select{
	instance_destroy();
}