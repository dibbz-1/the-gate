/// @function                 draw_interact_menu()
/// @description              This function will spawn the interaction menu.
function draw_interact_menu(){
	var _obj = obj_int_talk;
	var _event = talk;
	var _ops=0;
	
	for(var i=0; i<5; i++;){
		switch i{
			case 0:
				_obj=obj_int_talk;
				_event=talk;
			break;
			case 1:
				_obj=obj_int_look;
				_event=look;
			break;
			case 2:
				_obj=obj_int_sniff;
				_event=sniff;
			break;
			case 3:
				_obj=obj_int_take;
				_event=take;
			break;
			case 4:
				_obj=obj_int_use;
				_event=use;
			break;
		}
		if (_event!="null"){	
			var _x = 20;
			var _y = -20;
			
			if (x<obj_player.x){
				_x=-40;
			}
			
			if obj_game_manager.plrstate==1{
				_x=20;
			}
			
			with instance_create_layer(x+_x,y+(_ops*15)+_y,"int_menu",_obj){
				event=_event;
			}
			_ops++;
		}
	}
}

/// @param     {string} _event      The id of the scene to spawn.
/// @description                    This function takes the id of the provided "look" event and runs it through all possible events, then spawns the scene accordingly.
/// @deprecated
function spawn_observation_scene(_event){
	obj_game_manager.plrstate=1;
	var cam_x=camera_get_view_x(view_camera[0]);
	var cam_y=camera_get_view_y(view_camera[0]);
	
	
	var _background = noone; // the background of the scene
	var _interactables = []; // the sprite for each desired interactable instance
	var _interactables_x = []; // the x location of each instance (each location argument must have the same index as the interactable's sprite)
	var _interactables_y = []; // y location
	var _interactables_varstruct = []; // the events of the interactable
	
	// find the scene and init
	switch _event{
		case "test":
			_background = obj_lron;
			_interactables = [spr_tmater,spr_tmater,spr_tblock_g];
			_interactables_x = [80,30,54];
			_interactables_y = [20,70,30];
			_interactables_varstruct = [
				{
					take : "tkedef",
					item_id : "Tmater"
				},
				{
					take : "tkedef",
					item_id : "Tmater"
				},
				{
					talk : "tlkdef",
					use : "udef"
				}
			]
		break;
	}
	//if this scene is saved
	if instance_exists(_background){
		show_debug_message("This scene is saved and will be spawned with an alternative init.")
		
		for (var i = 0; i<array_length(global.sceneints); i++){
			if instance_exists(global.sceneints[i]) global.sceneints[i].visible=true;
		}
		global.scenebg.visible=true;
		
		show_debug_message("SUCCESS! all valid scene instances have been set to visible.")
	}
	else{
		// display init results in console
		show_debug_message("FINISHED INIT! displaying results...");
		show_debug_message("SCENE BACKGROUND WILL BE {0}",_background);
		for (var i = 0; i<array_length(_interactables); i++){
			show_debug_message("INTERACTABLE WITH SPRITE {0} WILL BE SPAWNED AT {1},{2} WITH VAR STRUCT {3}",_interactables[i],_interactables_x[i],_interactables_y[i],_interactables_varstruct[i]);
		}

	
		// spawn the initialized scene and save the instance ids into global variables to be destroyed later
		global.scenebg = instance_create_layer(cam_x,cam_y,"look_bg",_background);
		for (var i = 0; i<array_length(_interactables); i++){
			array_push(global.sceneints,instance_create_layer(cam_x+_interactables_x[i],cam_y+_interactables_y[i],"look_int",obj_look_interactable,_interactables_varstruct[i]));
			with global.sceneints[i]{
				sprite_index=_interactables[i];
			}
		}
	
		show_debug_message("SUCCESS! all instances were spawned. displaying instance ids...");
		show_debug_message("Background: {0} | Instances : {1}", global.scenebg, global.sceneints);
	}
}

/// @description                   Destroys the current observation scene and returns the game to normal. This will also save certain information about the scene, so if the player takes an item from the scene, it will not appear next time the scene is spawned.
/// @deprecated

function destroy_observation_scene(){
	//var instances_to_remove = [];
	for (var i = 0; i<array_length(global.sceneints); i++){
		if instance_exists(global.sceneints[i]) global.sceneints[i].visible=false;
		//else array_push(instances_to_remove,i);
	}
	global.scenebg.visible=false;
	
	// clear the array and var storing scene data
	
	//global.scenebg=noone;
	//array_delete(global.sceneints,0,array_length(global.sceneints));
}

/// @param       {string} _event   The desired scene you would like to teleport to.
/// @description                   Alternative way to execute the look event. This will teleport the camera to the scene, which will be off to the side of the room itself. This way the game won't have to keep track of a bunch of instances in a global array.

function find_observation_scene(_event){
	obj_game_manager.plrstate=1;
	switch _event{
		case "test":
			obj_cam.x=256;
			obj_cam.y=128;
		break;
	}
}

/// @description                  This function is used to check whether or not the player can use a specific item on an interactable instance.
function use_is_valid(){
	with global.intfocus{
		return array_contains(interacts_with, global.inhand);
	}
}

/// @param    {string} path       The location of the video file to be played.
/// @param    {boolean} interactive  Whether or not the cutscene has interactive elements. Defaults to false.
/// @ description                 This function will load and play a video file on top of the scene.

function load_video(path, interactive = false){
	if global.intfocus.talk=="SCN"{
		instance_create_layer(0,0,"Cutscenes",obj_video_player,{
			toplay : path
		}
		)
	} else if global.intfocus.talk=="NWS"{
		instance_create_layer(0,0,"Cutscenes",obj_video_player_int,{
			toplay : path
		})
	}
}