//cursor manager
var cursor_spr = spr_mouse

if plrstate==0{
	if position_meeting(mouse_x,mouse_y,obj_col){
		cursor_spr = spr_mouse_inv
	}
	if position_meeting(mouse_x,mouse_y,obj_interactable){
		cursor_spr = spr_mouse_int;
	}
	if position_meeting(mouse_x,mouse_y,obj_door){
		cursor_spr = spr_mouse_door;
	}
}
else{
	if position_meeting(mouse_x,mouse_y,obj_look_interactable){
		cursor_spr = spr_mouse_int;
	}
	if position_meeting(mouse_x,mouse_y,obj_switchboard){
		cursor_spr = spr_mouse_int;
	}
}

if !instance_exists(obj_textbox){ 
	// draw item in players hand
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

	// draw cursor
	draw_sprite(cursor_spr,0,mouse_x,mouse_y);
}

//draw_text(obj_player.x,obj_player.y-20,global.inhand)