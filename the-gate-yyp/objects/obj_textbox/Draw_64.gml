// --------- THANK YOU SO MUCH PEYTON BURNHAM FOR THE AWESOME TUTORIALS!!!!! --------------- \\
// while a lot of this was my own code, all of it was built off of Peyton's awesome tutorials. I think I learned more from Peyton than I ever did in school.

// confirm text and proceed/select.
var confirm = mouse_check_button_pressed(mb_left);
// skip text.
var cancel = mouse_check_button_pressed(mb_right);
// left
var left = keyboard_check_pressed(ord("A"));
// right
var right = keyboard_check_pressed(ord("D"));

//draw the text box
draw_sprite_ext(box_spr,0,box_x,box_y,box_wR/box_spr_w,box_hR/box_spr_h,0,c_white,1);
draw_set_font(fnt_proto);


if setup{
	// this setup runs once per dialogue event.
	
	drawChar=0;
	txtSpdR=txtSpd[page]
	
	// this block of code will repeat for each page of dialogue.
	for (var p=0;p<page_ind;p++){
		
		// set text length and pause length.
		txt_length[p]=string_length(text[p])
		pause_length[p]=txtSpd[p]*20; // comma pause length will be the text speed multiplied by 20.
		
		// repeats for every character in the page
		for (var c=0;c<txt_length[p];c++){
			
			// this var will be referenced instead of c when calculating character locations
			var char_pos = c+1
			
			// setting the "c"nth character of the "p"nth page to the "char_pos"nth character of the current page of dialogue
			char[c,p]=string_char_at(text[p],char_pos);
			
			// calculates how many characters are before the "c"nth character of the page.
			var txt_before_char=string_copy(text[p],1,c); // get all text before current character
			var current_txt_width=string_width(txt_before_char)-string_width(char[c,p]); // find the length of that text
			
			// if current character is a space, note it in the lfs var
			if char[c,p]=" "{
				lfs=char_pos+1;
			}
			
			// find line breaks
			
			// if the width of the text subtracted by the lb offset exceeds the desired line width;
			if current_txt_width-line_break_offset[p]>line_width{
				// set the line to break at the last free space
				line_break_pos[line_break_num[p],p]=lfs;
				// note the line break
				line_break_num[p]++;
				
				// get the word before the line break
				var txt_before_last_space = string_copy(text[p],1,lfs);
				// get the space character
				var last_free_space_str = string_char_at(text[p],lfs);
				
				line_break_offset[p] = string_width(txt_before_last_space)-string_width(last_free_space_str);
			}
		}
		
		// repeats for each character on the page
		for (var c=0;c<txt_length[p];c++){
			
			var char_pos=c+1 // same as before
			
			//starting point of the text 
			var txt_x=box_x+border;
			var txt_y=box_y+border;
			
			// calculates how many characters are before the "c"nth character of the page.
			var txt_before_char=string_copy(text[p],1,char_pos);
			var current_txt_width=string_width(txt_before_char)-string_width(char[c,p]);
			
			// counts the lines of text on the page.
			var txt_line=0;
			
			// repeats for each line break on the page
			for (var lb=0; lb<line_break_num[p]; lb++){
				//if the current character is further than the line break of its respective line;
				if char_pos >= line_break_pos[lb, p]{
					//find the width of that line and set the current text width to that value.
					var str_copy=string_copy(text[p],line_break_pos[lb,p],char_pos-line_break_pos[lb,p]);
					current_txt_width=string_width(str_copy);
					
					txt_line=lb+1;
				}
			}
			
			// set the characters position
			char_x[c,p]=txt_x+current_txt_width;
			char_y[c,p]=txt_y+txt_line*sep
		}
	}
	
	// set the text design vars
	draw_set_font(fnt_proto);
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	
	
	//display init results
	show_debug_message("text box init finished! Showing results-----");
	// print each page in the output console
	for (var pg=0;pg<page_ind;pg++){
		show_debug_message("{1}: {0}",text[pg],charPort[pg]);
	}

		
	//finish
	setup=false;
}

//box open animation
switch box_anim{
	case "width":
		box_wR+=box_w/box_anim_spd
	
		if box_wR>=box_w box_anim="height";
	break;
	case "height":
		box_hR+=(box_h-50)/box_anim_spd
		if box_hR>=box_h box_anim="fin";
	break;
	case "close":
		box_hR-=box_h/box_anim_spd
		if box_hR<=0 instance_destroy();
	break;
		
}

// when textbox is open:
if box_anim=="fin"{	
	// if player confirms:
	if confirm{
		// if page has printed all characters:
		if drawChar==txt_length[page]{
			// if this is the last page:
			if page==page_ind-1{
				
				// if player has selected an option:
				if op_ind>0{
					show_debug_message(option_link_id[opSelect])
					create_text(option_link_id[opSelect]);
				}
				
				// close the text box
				box_anim="close";
				
			}
			else{
				// flip the page
				show_debug_message("page flip");
				page_flip()
			}
		}
		// if dialogue was paused for a period, resume.
		if period{
			period=false;
			txtSpdR=txtSpd[page];
		}
	}
	// if player skips
	if cancel{
		if typing{
			// automatically finish typing
			drawChar=txt_length[page];
		}	
	}
	
	// the character being drawn
	var currentChar=string_copy(text[page],floor(drawChar),1);
	
	// if this character requires a pause
	if currentChar=="," or currentChar=="-"{
		// start timer
		timer++;
		// pause typing
		txtSpdR=0;
		
		// once timer reaches pause length
		if timer==pause_length[page]{
			// if page isn't finished, increase drawChar
			if !drawChar==txt_length[page] drawChar++;
			// return speed to normal
			txtSpdR=txtSpd[page]
			//reset timer
			timer=0;
		}
	}
	// if this character requires a full stop
	if currentChar=="." or currentChar=="?" or currentChar=="!"{
		//fully pause dialogue until user confirms
		
		if drawChar<txt_length[page] drawChar++;
		period=true;
		txtSpdR=0;
	}
	
	// type
	// if page is finished or dialogue is paused
	if drawChar==txt_length[page] or txtSpd==0{
		typing=false;
		charSub=0;
	} else{
		typing=true;
		
		// get real index of current character
		var charPrev=floor(drawChar);
		
		// "type" a character
		
		// if the drawChar variable is going to overflow, set the var to the page length. (otherwise the var will be out of range)
		if drawChar+txtSpdR>txt_length[page] drawChar=txt_length[page]
		// otherwise, continue as normal.
		else drawChar+=txtSpdR;
		
		// get real index of the current character after the text has advanced
		var charNew=floor(drawChar);
		
		// if text is not paused, advance the character portrait's animation TIMER
		if txtSpdR>0 && !period charTimer++
		
		if charTimer==charTimerSwitch{
			// advance character portrait's ANIMATION
			charSub++;
			// reset if overflow
			if charSub>4{
				charSub=0;
			}
			charTimer=0;
		}
		
		// if there is a new character being typed
		if charPrev!=charNew{
			// check for a step event at character if the character-to-type is new
			// more remenants from my old game I may use
			if step_pos[charNew,page]=true{
				global.cut_step++
			}
			if audio_char[charNew,page]!=noone{
				show_debug_message("sound to play: {0}",audio_char[charNew,page]);
				audio_play_sound(audio_char[charNew,page],2,0);
			}
			
			// play character's voice
			if txtSpd[page]>0.1{	
				voiceSwitch++
				if voiceSwitch==voiceFramePause{
					audio_play_sound(snd_meow,1,0);
					voiceSwitch=0;
				}
			}
			else audio_play_sound(snd_meow,1,0);
		}
	}
	
	
	
	var charSprite=noone;
	//portraits
	switch charPort[page]{
		case "dale":
			switch emote[page]{
				case "neutral":
					charSprite=spr_dale_neutral;
				break;
			}
		break;
		
		default:
			//nothing
		break;
	}
	if charSprite!=noone draw_sprite_ext(charSprite,charSub,box_x+box_w,box_y,3,3,0,c_white,1);
	
	// options
	if drawChar==txt_length[page] && page==page_ind-1{
		//arrow anim
		
		arrowSubTimer++
		if arrowSubTimer==arrowSubMax{
			arrowSub++
			if arrowSub==9{
				arrowSub=0;
			}
			arrowSubTimer=0;
		}
		
		for (var op=0; op<=op_ind; op++){
			
			// selection
			
			if left{
				opSelect--;
				if opSelect<1 opSelect+=op_ind;
			}
			if right{
				opSelect++;
				if opSelect>op_ind opSelect-=op_ind;
			}
		
			//selection icon
			if opSelect == op{
				draw_sprite_ext(spr_opSelect,arrowSub,(box_x+100+300*(op-1))-17,box_y+130,2,2,0,c_white,1);
			}
		
			//text
			draw_set_halign(fa_left);
			draw_text(box_x+100+300*(op-1),box_y+130,option[op])
		}
	}
	
	// draw text
	for (var c=0; c<drawChar; c++){
		
		var floatY=0;
		var shakeX=0;
		var shakeY=0;
		//silly stuff
		if floatAmnt[c,page]>0{
			floatDir[c,page] += floatAmnt[c,page]*-1;
			floatY = dsin(floatDir[c,page])*3;
		}
		if shakeAmnt[c,page]>0{
			randomize();
			var shake =shakeAmnt[c,page]/5;
			shakeX=random_range(shake*-1,shake)
			shakeY=random_range(shake*-1,shake)
		}
		if sepAmnt[c,page]>0{
			randomize();
			var shake =sepAmnt[c,page]/5;
			char_x[c,page]+=random_range(shake*-1,shake)
			char_y[c,page]+=random_range(shake*-1,shake)
		}
		
		draw_set_halign(fa_left);
		//draw
		draw_text_color(char_x[c,page]+shakeX,char_y[c,page] + floatY +shakeY,char[c,page],col_1[c,page],col_2[c,page],col_3[c,page],col_4[c,page],1);
	}
}

