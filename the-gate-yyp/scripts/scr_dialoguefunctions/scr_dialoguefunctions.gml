// This looks scary but I tried by best to explain everything.

/* 
	Basically, these functions all handle the dialogue. The textbox object is what calls all of these,
	but the create_text() function is called by the object that the player interacts with. Each
	function will have a detailed description about what it does, that way you don't have to reference
	any kind of documentation.
*/


/// @param {string} _id  The identifier for the dialogue event.
/// @description         This function runs through all available dialogue events and runs the event corosponding with _id.

function text_id_is(_id){
	switch _id{
		case "tlkdef":
			text_engine("Hey, punk.");
			text_engine("I don't talk to goofy looking cats, so you better scram before I take out my laser pointer");
			text_engine("...");
			text_engine("tough crowd.");
		break;
		
		// this generic dialogue event will be used for casual interactions between any item and any interactable. 
		case "udef":
			if global.inhand!=""{
				if use_is_valid(){
					array_remove(global.plr_strg, global.inhand);
					var log_after_use = global.intfocus.log_after_use;
				
					text_engine(string("*Traci threw the {0} at {1}.*", global.inhand, global.intfocusid),"G");
					global.inhand="";
				
					if log_after_use!="null"{
						event_create_new_log(log_after_use);
					}
				}
				else {
					text_engine("*Traci cannot use that here.*","G");
					
				}
			}
			else{
				text_engine("*Traci is not holding anything in his hand.*","G");
			}
		break;
		
		case "tkedef":
			text_engine(string("*Traci took the {0}*",global.intfocusid),"G");
		break;
		
		case "lron":
			text_engine("hi. Im l ron hubbard. im a penis. don't throw those tomatoes at me.");
		break;
		
		case "lrontmater":
			text_engine("i told you not to do that. why would you disrespect me like this. you bastard. you must now pay a disrespect fee of $899.");
		break;
		
		case "log_full_test00":
			text_engine("Yo, you look like me.","player");
			event_create_new_log("log_full_test01");
		break;
		case "log_full_test01":
			text_engine("indeed I do.","intfocus")
		break;
		
		case "tracinoitems":
			text_engine("*Traci isn't holding any items*","G")
		break;
	}
}

/// @description         Resets text-effect values to defaults.
function text_defaults(){
	line_break_pos[0, page_ind]=999;
	line_break_num[page_ind]=0;
	line_break_offset[page_ind]=0;
	event[page_ind]="";
	newlog="";
	
	
	// vars for every letter
	for (var c=0; c<500; c++){
		col_1[c,page_ind]=c_white;
		col_2[c,page_ind]=c_white;
		col_3[c,page_ind]=c_white;
		col_4[c,page_ind]=c_white;
		
		//text movement
		floatAmnt[c,page_ind]=0;
		floatDir[c,page_ind]=20*c;
		
		shakeAmnt[c,page_ind]=0;
		sepAmnt[c,page_ind]=0;
		
		step_pos[c,page_ind]=0;
		step_rep[c,page_ind]=0;
		audio_char[c,page_ind]=noone;
	}
}

/// @param  {string} _log  The id of the desired dialogue event.
/// @description           Spawns the textbox and calls for the dialogue event corosponding with _log.

function create_text(_log){
	with instance_create_depth(0,0,-999,obj_textbox){
		text_id_is(_log);
	}
}

/// @param  {string} _text        Dialogue to be shown in the text box.
/// @param  {string} _char        The character speaking. (default: "none")
/// @param  {string} _emote       The emotion of the character. (default
/// @param  {real}   _spd         The speed of the text.

/// @description                  Defines the dialogue, character, emotion and speed of the page of dialogue.

function text_engine(_text,_char="none",_emote="neutral",_spd=1){
	// effects
	text_defaults();
	// Last Free Space
	lfs=0;
	
	text[page_ind]=_text;
	charPort=_char;
	emote[page_ind]=_emote;
	txtSpd[page_ind]=_spd;
	
	page_ind++;
}

// ----------------------- effects ---------------------
// these effects are used to add a little bit of spice to the dialogue and make it feel more alive.

/// @param   {real}  _startChar  Where the color starts in the dialogue.
/// @param   {real}  _endChar    Where the color ends in the dialogue.
/// @param   {color} _col1       The first, or only, color of the text. (all following colors will default to this one, otherwise it will create a gradient.)
/// @param   {color} _col2       The second color.
/// @param   {color} _col3       The third.
/// @param   {color} _col4       The fourth.

/// @description                 Use this script to add color to a line of dialogue. This can be a gradient, or, if only _col1 is defined, a solid color.

function text_color(_startChar,_endChar,_col1,_col2=_col1,_col3=_col1,_col4=_col1){
	for (var c=_startChar;c<=_endChar;c++){
		col_1[c,page_ind-1]=_col1;
		col_2[c,page_ind-1]=_col2;
		col_3[c,page_ind-1]=_col3;
		col_4[c,page_ind-1]=_col4;
	}
}

/// @param   {real} _startChar    Where the color starts in the dialogue.
/// @param   {real} _endChar      Where the color ends in the dialogue.
/// @param   {real} _floatAmount  How aggresive the floating effect will be.

/// @description                  Adds a floating effect to a string of dialogue.

function textWave(_startChar,_endChar,_floatAmount){
	for (var c=_startChar;c<=_endChar;c++){
		floatAmnt[c,page_ind-1]=_floatAmount;
	}
}

/// @param   {real}  _startChar    Where the color starts in the dialogue.
/// @param   {real}  _endChar      Where the color ends in the dialogue.
/// @param   {real}  _shakeAmount  How aggresive the shaking effect will be.

/// @description                   Adds a shaking effect to a string of dialogue.

function textShake(_startChar,_endChar,_shakeAmount){
	for (var c=_startChar;c<=_endChar;c++){
		shakeAmnt[c,page_ind-1]=_shakeAmount;
	}
}

/// @param   {real}  _startChar  Where the color starts in the dialogue.
/// @param   {real}  _endChar    Where the color ends in the dialogue.
/// @param   {real}  _sepAmount  How quickly the text will fall apart.

/// @description                 I made this effect by accident, but thought it looked kinda cool so I kept it. Makes the dialogue fall apart in random directions.

function textFloatApart(_startChar,_endChar,_sepAmount){
	for (var c=_startChar;c<=_endChar;c++){
		sepAmnt[c,page_ind-1]=_sepAmount;
	}
}

// -------------------- options -------------------

/// @param   {string} _option     The display text for the option.
/// @param   {string} _opLinkId   The dialogue event that will run if this option is selected.

/// @description                  Displays an option that will appear once text is finished being typed. Create several options by simply repeating this function.

function options(_option,_opLinkId){
	op_ind++;
	
	option[op_ind]=_option;
	option_link_id[op_ind]=_opLinkId;
}

// --------------- cutscene step after dialogue is finished ---------------------------

// obsolete atm, but may end up using some of these (I coppied all of this from an old game.)

/// @param       {string} log_id      The id of the dialogue event you would like to initiate.
/// @description                      This function allows you to initiate a dialogue event within a dialogue event. This event will activate immediately after the current dialogue event.

function event_create_new_log(log_id){
	newlog = log_id;
	event[page_ind-1]="newlog";
}

function event_step(steps=1){
	step_rep[page_ind-1]=steps;
	event[page_ind-1]="step";
}
function event_step_fight(steps=1){
	step_rep[page_ind-1]=steps;
	event[page_ind-1]="fight step";
}
function event_exit(steps=1){
	step_rep[page_ind-1]=steps;
	event[page_ind-1]="exit";
}
function step_at_character(_character){
	step_pos[_character,page_ind-1]=true;
}
function play_sound_at_character(sound_index,_character){
	audio_char[_character,page_ind-1]=sound_index;
}