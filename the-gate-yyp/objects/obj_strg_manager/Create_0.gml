strg_label = global.plr_strg;

global.inhand="";

for(var i=0; i<array_length(strg_label); i++){
	var _obj=noone;
	var _label=strg_label[i];
	switch _label{
		case "Tmater":
			_obj=obj_strg_tmater;
		break;
		
		//--------------------------------------------------
		
		default:
			_obj=obj_otherguytemp;
			_label="otherguy alert";
		break;
	}
	switch obj_game_manager.plrstate{
		case 0:
			with instance_create_depth(obj_player.x+30,obj_player.y-i*24,-9999,_obj){
				label=_label;
			}
		break;
		case 1:
			with instance_create_depth(camera_get_view_x(view_camera[0])+40+i*32,camera_get_view_y(view_camera[0])+200,-9999,_obj){
				label=_label;
			}
		break;
	}
	
}

if array_length(strg_label)==0{
	create_text("tracinoitems");
	instance_destroy();
}