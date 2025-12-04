/// @description               This function finds the index of an item within an array and removes it.

/// @param        array        The array to remove the item from.
/// @param        item         The item to remove.

function array_remove(array,item){
	for(var i = 0; i<array_length(array); i++){
		if array[i]==item{
			array_delete(array,i,1);
			break;
		}
	}
}

/// @param     {real} targ_x  The X location Traci should be in when the room switches.
/// @param     {real} targ_y  The Y location Traci should be in when the room switches.
/// @param     {real} targ_rm The room to transition into.
/// @param     {real} dur     The amount of frames the fade will last. (In and out.)
/// @param     {real} col     The color of the crossfade.

/// @description              This function will create a crossfade effect between rooms, and place Traci in a specific location within that room.

function rm_fade(_targ_x,_targ_y,_targ_rm,_dur,_col){
	with instance_create_depth(0,0,-9999,obj_fade){
		targ_x=_targ_x;
		targ_y=_targ_y;
		targ_rm=_targ_rm;
		dur=_dur;
		col=_col;
	}
}