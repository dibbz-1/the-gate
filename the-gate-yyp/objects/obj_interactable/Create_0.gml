menu=0;

/// @description      Sets up the interactive menu and functions for this instance.
function setup_int(){
	global.intfocus=id;
	// if the instance has an item id, set the interactive focus id to that.
	if item_id!="null" global.intfocusid=item_id;
	draw_interact_menu();
}