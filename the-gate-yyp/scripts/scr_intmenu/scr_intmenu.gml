//function for drawing the interaction menu.
/// @function                 draw_interact_menu()
/// @description              Spawn the interaction menu.
function draw_interact_menu(){
	var _obj = obj_int_talk;
	var _event = talk;
	var _ops=0;
	
	for(var i=0; i<5; i++;){
		switch i{
			case 0:
				_obj=obj_int_talk;
				_event=talk;
			break;
			case 1:
				_obj=obj_int_stare;
				_event=stare;
			break;
			case 2:
				_obj=obj_int_sniff;
				_event=sniff;
			break;
			case 3:
				_obj=obj_int_take;
				_event=take;
			break;
			case 4:
				_obj=obj_int_use;
				_event=use;
			break;
		}
		if (_event!="null"){	
			var _x = 20;
			
			if (x<obj_player.x){
				_x=-50;
			}
			
			with instance_create_depth(x+_x,y+(_ops*15)-30,depth-1,_obj){
				event=_event;
			}
			_ops++;
		}
	}
}