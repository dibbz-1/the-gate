//set temp var for the select action (left mouse button)
var select = mouse_check_button_pressed(mb_left);

//if mouse is hovering over instance
if position_meeting(mouse_x,mouse_y,id){
	//make instance larger
	image_xscale=1.7
	image_yscale=1.7
	//if left mouse button is clicked
	if select{
		//create textbox with specified event text
		scr_textboxtemp(event);
	}
} else{
	//if mouse is not hovering over instance, return to normal size.
	image_xscale=1.5
	image_yscale=1.5
}
if select{
	//destroy all text, and if the player selected "take," destroy the instance that was interacted with.
	instance_destroy();
	if inst_id==3{
		instance_destroy(global.intfocus);
		array_push(global.plr_strg,global.intfocusid);
		
	}
}