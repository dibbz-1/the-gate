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
	with instance_create_depth(obj_player.x+30,obj_player.y-i*24,-9999,_obj){
		label=_label;
	}
}

if array_length(strg_label)==0{
	scr_textboxtemp("tracinoitems");
	instance_destroy();
}