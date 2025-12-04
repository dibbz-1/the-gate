//declare temporary variables for player x and y coords
var plrx = obj_player.x;
var plry = obj_player.y;

//if player is a certain distance from thge center of the screen, set transition to 1 (true)
if (abs(plrx-x)>=80 or abs(plry-y)>=40) && (obj_player.walk_setup==0) && !obj_game_manager.plrstate==1{
	transition=1;
}

//when transition is true, pan the cam to player
if transition{
	move_towards_point(plrx,plry,transpeed);
	
	if point_distance(x,y,plrx,plry)<10{
		transition=0;
		speed=0;
	}
}