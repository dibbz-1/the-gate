//cursor manager
var cursor_spr = spr_mouse
if position_meeting(mouse_x,mouse_y,obj_interactable){
	cursor_spr = spr_mouse_int;
}

draw_sprite(cursor_spr,0,mouse_x,mouse_y);

draw_text(obj_player.x,obj_player.y-20,global.inhand)