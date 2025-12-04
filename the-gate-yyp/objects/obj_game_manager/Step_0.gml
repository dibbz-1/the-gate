var inventory = keyboard_check_pressed(vk_tab);

depth=-9999;

if inventory{
	if !instance_exists(obj_strg_manager) instance_create_depth(x,y,0,obj_strg_manager);
}

if plrstate==1{
	if keyboard_check_pressed(vk_escape){
		obj_cam.x=obj_player.x;
		obj_cam.y=obj_player.y;
		plrstate=0;
	}
}

// save and load (testing, to be moved eventually. this will likely be an autosave.)

if obj_player.walk_setup==0{
	if keyboard_check_pressed(vk_enter){
		file_save();
		save_trig=true;
		salpha=1;
	}

	if keyboard_check_pressed(vk_delete){
		file_load();
		load_trig=true;
		lalpha=1
	}
}