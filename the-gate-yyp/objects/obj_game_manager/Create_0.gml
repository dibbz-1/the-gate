//bruh

global.intfocus=noone;
global.plr_strg=[];
global.inhand="";
global.intfocusid="";

global.scenebg=noone;
global.sceneints=[];

plrstate=0;

/*
						PLAYER STATES
			0 -- normal- able to walk around and interact with objects.
			1 -- looking- currently observing a scene.
			2 -- cutscene- watching a cutscene.
*/

grid = mp_grid_create(0,0,room_width/16,room_height/16,16,16);

mp_grid_add_instances(grid,obj_col,false);

destroyed_instances=[];

save_trig = false;
load_trig = false;
salpha = 0;
lalpha = 0;

quickfails=0;