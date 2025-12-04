//cursor manager
var cursor_spr = spr_mouse

if plrstate!=1{
	if position_meeting(mouse_x,mouse_y,obj_col){
		cursor_spr = spr_mouse_inv
	}
	if position_meeting(mouse_x,mouse_y,obj_interactable){
		cursor_spr = spr_mouse_int;
	}
}
else{
	if position_meeting(mouse_x,mouse_y,obj_look_interactable){
		cursor_spr = spr_mouse_int;
	}
}

if global.inhand!=""{
	var _spr = spr_tmater
	switch global.inhand{
		case "Tmater":
			_spr = spr_tmater;
		break;
		
		default:
			_spr = spr_otherguy;
		break;
	}
	draw_sprite(_spr,0,mouse_x-5,mouse_y+5);
}

draw_sprite(cursor_spr,0,mouse_x,mouse_y);

//draw_text(obj_player.x,obj_player.y-20,global.inhand)