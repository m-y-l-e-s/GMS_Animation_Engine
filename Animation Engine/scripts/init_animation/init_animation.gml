/// @description Initialize the animation engine.

//==Usage Example==
//	In Create Event (ideally up near the top)
//		init_animation();

//All instance variables given prefix __AE_ to denote they are for
//	this Animation Engine to reduce interference with user code.

//Create the DS_MAP that will hold
//	{string} animation names -> {ds_list} frames to use when animating
//	key-value pair
__AE_animation_map = ds_map_create();

//Create a DS_LIST containing each key that is added to the animation_map
//	We will iterate through this list when we destroy an object and destroy
//	each of the ds_list that holds the animation frames
__AE_animation_map_keys = ds_list_create();

//Set the initial animation that the engine will play to nothing.
__AE_current_playing_animation = "";

//Variable that the animation engine will use to determine whether or not
//	the animation should be paused.
__AE_animation_paused = false;

//Set the internal animation speed to 0 so the sprites won't do their 
//	own thing
image_speed = 0;