var plrx = obj_player.x;
var plry = obj_player.y;

if abs(plrx-x)>=120 or abs(plry-y)>=80{
	show_debug_message("character out of view");
	transition=1;
}

if transition{
	move_towards_point(plrx,plry,transpeed);
	
	if point_distance(x,y,plrx,plry)<10{
		transition=0;
		speed=0;
	}
}