show_debug_message("This cutscene will be interactive.");
show_debug_message("Attempting to load file: {0}",toplay);
video = video_open(string("Cutscenes/News/{0}",toplay));
show_debug_message("File found!");

video_enable_loop(false);

// load the interactive elements.

timer=0;
next_event=0;

cam=0;
img=0;
snd=0;

fail=90;
misses=0;
drawbad=0;

switch toplay{
	case "news-test.mp4":
		/*
			This process will require you to play the video in an editing software 
			and determine the EXACT frame >> BEFORE << the event will occur. Note these in the
			event-frame array, and note the event the the event array. 
			Also make sure you add a noone to the end of the event_frame
			array so that the next_event isn't outside the array's index.
		*/
		
		event_frame=[203,277,349,noone];
		event=["cam","img","snd"];
	break;
	
	default:
		event_frame=[noone];
		event=["bitch"];
	break;
}