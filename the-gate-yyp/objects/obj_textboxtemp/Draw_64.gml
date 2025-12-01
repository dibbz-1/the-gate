//check if player is advancing dialogue
if mouse_check_button_pressed(mb_any) && delay{
	page++;
}

//check if player has reached the end of the dialogue strand
if page==page_count{
	instance_destroy();
}
else{
	//draw text on current page
	draw_text(200,200,dialogue[page]);
}

//without a delay, the textbox immediately disappears.
delay=1