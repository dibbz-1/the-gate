draw_set_font(fnt_proto_med);
draw_set_halign(fa_left);
draw_text(10,10,plrstate);

// save and load graphics

if salpha>0{
	draw_text_colour(20,50,"SAVED...", c_white,c_white,c_white,c_white,salpha);
	salpha-=0.05;
}
if lalpha>0{
	draw_text_colour(20,50,"LOADED...", c_white,c_white,c_white,c_white,lalpha);
	lalpha-=0.05;
}