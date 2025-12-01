//this is a temporary, rudimentary setup for the textbox feature. Used this until I took my finished textbox element from my other game.
function scr_textboxtemp(text){
	show_debug_message("text created with id {0}",text);
	with instance_create_depth(0,0,0,obj_textboxtemp){
		textboxtempidis(text);
	}
}

function textboxtempidis(text_id){
	switch text_id{
		case "tlkdef":
			tenginetemp("don't talk to me.");
			tenginetemp("i don't talk to pink boxes.");
			tenginetemp("so you better get away.");
			tenginetemp("testing long strands of dialogue.");
		break;
		
		case "stdef":
			tenginetemp("dont look at me like that.");
		break;
		case "sndef":
			tenginetemp("do i smell okay?");
			tenginetemp("i sure hope so.");
		break;
		case "tkedef":
			tenginetemp("traci took the test cube.");
			tenginetemp("but the test cube refused.");
		break;
		case "udef":
			if global.inhand==""{
				tenginetemp("Traci isn't holding an item.");
			} else if global.inhand=="Tmater"{
				global.inhand="";
				array_remove(global.plr_strg,"Tmater");
				tenginetemp("Traci used Tmater on the test cube.");
				tenginetemp("Tmater was thrown onto the test cubes face.");
			}
			else{
				tenginetemp("Traci can't use that here.");
			}
		break;
		case "othergy":
			tenginetemp("Hi I'm other guy.");
			tenginetemp("I look a little funny but its what makes me special.");
		break;
		case "tmater":
			tenginetemp("*Traci took the tmater*");
			tenginetemp("yooo whyd you do that??");
		break;
		case "tracinoitems":
			tenginetemp("*Traci isn't holding anything.");
		break;
	}
}

function tenginetemp(text){
	dialogue[page_count]=text;
	page_count++;
}