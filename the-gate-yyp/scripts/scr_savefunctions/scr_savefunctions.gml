function file_save(){
	
	var dat = {
		
		strg : global.plr_strg,
		dst_inst : destroyed_instances,
		x : obj_player.x,
		y : obj_player.y,
		inhand : global.inhand
		
	}
	
	var dat_string = json_stringify(dat);
	
	var save = file_text_open_write("dat.txt");
	
	file_text_write_string(save, dat_string);
	
	file_text_close(save);
	
}

function file_load(){
	
	if file_exists("dat.txt"){
		
		var save = file_text_open_read("dat.txt");
		
		var dat_string = file_text_read_string(save);
		
		var dat = json_parse(dat_string);
		
		global.plr_strg = dat.strg;
		
		destroyed_instances = dat.dst_inst;
		
		obj_player.y = dat.y;
		obj_player.x = dat.x;
		
		global.inhand = dat.inhand;
		
		file_text_close(save);
		
	} else{
		show_debug_message("There is no existing file by that name.");
	}
	
}