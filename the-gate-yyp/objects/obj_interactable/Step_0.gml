//declare variables for player input
var act = mouse_check_button_pressed(mb_right);

//when using a draw event, you have to draw the sprite manually with this function or else it will not be visible.
draw_self();

//if player right clicks
if position_meeting(mouse_x,mouse_y,id){
	if act{
		//if the interaction menu is not open, no textbox exists, and the player is a certain distance from this instance, set the global interaction focus to the id of the instance and spawn menu.
		if obj_game_manager.plrstate!=1{
			if !instance_exists(obj_int_menufunctions) && !instance_exists(obj_textbox){
				setup_int();
			}
		}
	}
}

