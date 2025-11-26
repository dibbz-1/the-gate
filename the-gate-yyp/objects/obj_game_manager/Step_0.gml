var inventory = keyboard_check_pressed(vk_tab);

depth=-9999;

if inventory{
	if !instance_exists(obj_strg_manager) instance_create_depth(x,y,0,obj_strg_manager);
}