for (var i = 0; i < array_length(destroyed_instances); i++){
	instance_destroy(destroyed_instances[i]);
}

global.rm_scale=1000-obj_rm_scale.image_xscale*10;