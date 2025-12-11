show_debug_message("This cutscene will not be interactive.");
show_debug_message("Attempting to load video file: {0}", toplay);
video = video_open(string("Cutscenes/{0}",toplay));
show_debug_message("File found!");

video_enable_loop(false);