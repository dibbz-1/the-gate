//set up variables for the text engine
page=0;               // the total amount of pages
page_ind=0;           // the page being drawn
text[0]="I AM ERROR"; // the text on each page of the event.
txt_length[0]=0;      // the length of the text on each page of the event.
sep=45;               // the size of the space in between lines of text.
txtSpd[0]=1;          // the speed the text will be typed at.
txtSpdR=1;            // the speed the text is CURRENTLY being typed at (sets to 0 during pauses)
drawChar=0;           // the character (letter) currently being drawn.
typing=true;          // whether or not the text is currently being typed


//vars for comma and period pauses
pause_length[0]=0;    // the amount of frames the text will pause for.
timer=0;              // counts down from pause_length[i].
period=false;         // whether or not the current character is a period.

//vars for letters

/* 2-dimensional arrays are like a table that provides multiple "dimensions" of information.

for example:
var[0,0] = 6

var[0,1] = 9

var[1,0] = 7

var[1,1] = 8

would be visualized like:

       |  0  |  1
 ------|-----|------
    0  |  9  |  7
 ------|-----|------
    1  |  9  |  8



*/

char=[0,0];           // tracks the character of the page that is being initialized
char_x=[0,0];         // the x of the character on the page
char_y=[0,0];         // the y of the character on the page


//vars for drawing the text box
box_spr=spr_textbox;                       // sets the sprite for the textbox (kinda redundant but whatever)
box_spr_w=sprite_get_width(spr_textbox);   // finds the width of the box sprite (NOT the size of which to draw it)
box_spr_h=sprite_get_height(spr_textbox);  // finds the height

box_sub_img = 0;
box_sub_timer = 5;

box_w=900;                                 // the size that the box will be drawn
box_h=300;

box_x=50;                                  // the position the box will be drawn
box_y=450;

border=60;                                 // the padding around the text

box_anim="width";                          // the state of the textbox opening animation
box_anim_spd=8;                            // the speed of the opening animation

line_width=box_w-border*2.3;                 // the width of each line before a break

//vars for drawing character portrait

charSub=0;          // the sprites sub-image
charTimer=0;        // one this reaches zero it changes the sub-image
charTimerSwitch=4;  // how many frames to wait before changing subimg
charPort[0]="none"; // the character speaking
emote[0]="neutral"; // the characters emotion

voiceSwitch=0;      // plays character voice upon countdown
voiceFramePause=7;  // how many frames between each voice

logtype="def";      // obsolete

//vars for init
setup=true;                       // if text needs to be set up

line_break_pos[0, page_ind]=999;  // where each line break is located on each page
line_break_num[page_ind]=0;       // the number of line breaks on a page
line_break_offset[page_ind]=0;    // i don't remember

text_defaults();
lfs=0;                            // last free space where line can be broken

//vars for options
op_ind=0;               // the amount of options to draw
option[0]="";           // the display text for the option to be drawn
option_link_id[0]="";   // the id of the option to be drawn

opSelect=1;             // which option is being hovered over
arrowSub=0;             // the subimg of the arrow 
arrowSubTimer=0;        // i think you get it
arrowSubMax=5;          //yup

//page flip function
function page_flip(){
	typing=true;
	drawChar=0;
	page++
	period=false;
	txtSpdR=txtSpd[page];
}