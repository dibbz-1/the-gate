var _w = 1000;
var _h = 750;

switch state{
	case 0: // fade in
		draw_sprite_ext(spr_fade,0,0,0,_w,_h,0,col,alpha);
		alpha+=1/dur;
		if alpha==1 state++;
	break;
	case 1: // transitioning
		room=targ_rm;
		obj_player.x=targ_x;
		obj_player.y=targ_y;
		obj_cam.x=targ_x;
		obj_cam.y=targ_y;
		
		state++;
	break;
	case 2: // fade out
		draw_sprite_ext(spr_fade,0,0,0,_w,_h,0,col,alpha);
		alpha-=1/dur;
		if alpha==0 state++;
	break;
	case 3: // fin
		instance_destroy();
	break;
}