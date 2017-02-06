/// @description Play the named animation
/// @param {string} (optional) animation_name Name of the animation that you want to play

//==Usage Example==
//	In Step Event (usually after a keyboard_check)
//		play_animation("idle-right");
//			-Play the defined animation "idle-right" if it exists
//
//	In Step Event at very end of script !!IMPORTANT
//		play_animation();
//			-You must call this at the end of your step event so the animation engine
//				is able to update the animation to show the next frame

//Find the seconds that have passed since the game was started.  This will be used
//	to calculate which frame should be shown.
var seconds_since_game_start = get_timer() / 1000000;

//If they provided a named animation...
if(argument_count == 1)
{
	//Store the animation name into a readable variable
	var animation_name = argument[0];
	
	//If the animation they named is NOT currently running but it DOES exist...
	if(animation_name != __AE_current_playing_animation && ds_map_exists(__AE_animation_map, animation_name))
	{
		//Retrieve the DS_LIST identifier from the animation_map for this named animation
		__AE_animation_frames = __AE_animation_map[? animation_name];

		//Get the total number of frames in the DS_LIST, then subtract 2 to compensate for
		//	the 0 index and the FPS value in the last location on the list.
		__AE_animation_frames_length = ds_list_size(__AE_animation_frames) - 2;
		
		//Grab the FPS from the DS_LIST for the named animation
		__AE_animation_speed_fps = ds_list_find_value(__AE_animation_frames, __AE_animation_frames_length + 1);
	
		//Set the named animation to the current_playing_animation cache
		__AE_current_playing_animation = animation_name;
		
		//Set the timestamp of when this animation was first started.  This allows us to
		//	play this animation on its own timeline.  If we did not do this we could switch
		//	animation and the new animation would start partially through the frame list.
		__AE_animation_start_time = seconds_since_game_start;
		
		//Unpause the animation if it was paused.
		__AE_animation_paused = false;
	}
}

//If the current playing animation is "" we will assume nothing should be playing and skip
//	the animation code.  If the animation is currently paused we should skip frame update.
if(__AE_current_playing_animation != "" && __AE_animation_paused == false)
{
	//Find the seconds that we have been in the currently playing animation, round down to
	//	get a whole number.  Multiply that value by the desired FPS, then find the modulus
	//	with the total number of frames to determine which item in the frame array we
	//	should be setting the sprite to.
	var animation_index = floor((seconds_since_game_start-__AE_animation_start_time) * __AE_animation_speed_fps) mod __AE_animation_frames_length;
	
	//Set the image_index to the value in the named animation DS_LIST at spot animation_index
	image_index = ds_list_find_value(__AE_animation_frames, animation_index) - 1;
}