/// @description Define a new animation.
/// @param {string} animation_name The friendly name that this animation will be called
/// @param {array} animation_frames The frames that this animation consists of.  Starts at 1 to match item numbering in GM sprite editor.
/// @param {real} animation_fps The FPS that this animation should play at.

//==Usage Example==
//	In Create Event AFTER init_animation()
//		create_animation("idle-right", [1,1,1,1,2,3], 5);
//			-Create a new animation called "idle-right"
//			-Set the "idle-right" animation to sprite frames [1,1,1,1,2,3]
//			-This animation will play at 5 FPS

//Set the function parameters to friendly names for code readability
var animation_name = argument0;
var animation_frames = argument1;
var animation_fps = argument2;

//Count how many items are in the animation_frames array
var frames_count = array_length_1d(animation_frames);

//Create a DS_LIST that will hold the frames that were provided as an array in the constructor
var frames_list = ds_list_create();

//Loop through each of the items in the array
for(var i = 0; i < frames_count; i++)
{
	//Add the animation_frames into the frames_list DS_LIST
	frames_list[| i] = animation_frames[i];
}

//Place the animation_fps at the end of the frames_list DS_LIST
frames_list[| (frames_count+1)] = animation_fps;

//Add the frames_list DS_LIST to the animation_map using the animation_name as the key
__AE_animation_map[? animation_name] = frames_list;

//Add the animation_name to the end of the animation_map_keys DS_LIST so we can destroy
//	the frames_list later.
ds_list_add(__AE_animation_map_keys,animation_name);