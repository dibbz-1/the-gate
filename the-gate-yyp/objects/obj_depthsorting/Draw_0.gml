draw_self();

draw_set_font(fnt_proto_small)
draw_set_halign(fa_center);

draw_text(x,y-50,depth);
draw_text(x,y-60,string(id.layer));