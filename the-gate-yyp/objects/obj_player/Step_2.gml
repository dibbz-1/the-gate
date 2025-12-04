// determine traci's direction

if direction>-22.5 && direction<=22.5{
	dir="r";
}else
if direction>22.5 && direction<=67.5{
	dir="ur";
}else
if direction>67.5 && direction<=112.5{
	dir="u";
}else
if direction>112.5 && direction<=157.5{
	dir="ul";
}else
if direction>157.5 && direction<=202.5{
	dir="l";
}else
if direction>202.5 && direction<=247.5{
	dir="dl";
}else
if direction>247.5 && direction<=292.5{
	dir="d";
}else
if direction>292.5 && direction<=337.5{
	dir="dr";
}



switch dir{
	case "u":
		sprite_index = spr_traci_walk_u;
	break;
	case "d":
		sprite_index = spr_traci_walk_d;
	break;
	case "l":
		sprite_index = spr_traci_walk_r;
	break;
	case "r":
		sprite_index = spr_traci_walk_l;
	break;
	case "ul":
		sprite_index = spr_traci_walk_ul;
	break;
	case "ur":
		sprite_index = spr_traci_walk_ur;
	break;
	case "dl":
		sprite_index = spr_traci_walk_dl;
	break;
	case "dr":
		sprite_index = spr_traci_walk_dr;
	break;
}

if xprev==x && yprev==y{
	walk_setup=0;
}