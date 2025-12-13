player_approach=false;
plr_dist=0;

// @description         Executes the event the player selected.
function int_exec(){
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