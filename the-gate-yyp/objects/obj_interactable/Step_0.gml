//declare variables for player input
var act = mouse_check_button_pressed(mb_right);

//when using a draw event, you have to draw the sprite manually with this function or else it will not be visible.
draw_self();

//if player right clicks
if position_meeting(mouse_x,mouse_y,id){
	if act{
		//if the interaction menu is not open and no textbox exists, set the global interaction focus to the id of the instance and spawn menu.
		if !instance_exists(obj_int_menufunctions) && !instance_exists(obj_textbox){
			global.intfocus=id;
			if item_id!="null" global.intfocusid=item_id;
			draw_interact_menu();
		}
	}
}

depth=y*-1;