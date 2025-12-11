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
		if inst_id!=1 && global.intfocus.cutscene_id == "null" {
			create_text(event);
		}
		// if there is a cutscene attatched to the event, load and play the video.
		else if global.intfocus.cutscene_id != "null" {
			load_video(global.intfocus.cutscene_id,global.intfocus.talk=="NWS");
		}
		// if player selected take, destroy the taken object. if player selected look, spawn the observation scene.
		switch inst_id{
			case 3:
			instance_destroy(global.intfocus);
			array_push(global.plr_strg,global.intfocusid);
			break;
		
			case 1:
			//spawn_observation_scene(event);
			find_observation_scene(event);
			break;
		
		}
	}
} else{
	//if mouse is not hovering over instance, return to normal size.
	image_xscale=1.5
	image_yscale=1.5
}
if select{
	//destroy all text
	instance_destroy();
}