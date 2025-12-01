/// @function                  array_remove(array, item)
/// @description               Finds the index of an item and removes it from the array.

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