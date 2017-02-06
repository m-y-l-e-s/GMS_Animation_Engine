/// @description Cleanup all data structures for the animation engine

//==Usage Example==
//	In Destroy Event !!IMPORTANT
//		cleanup_animation();
//			-You MUST call this in the destroy event for any object that is using
//				the animation engine.  If you fail to run this function you will
//				undoubtedly run into memory issues with your game as this will
//				leave floating data structures in memory.

//Set the current playing animation to "" so the step event will not attempt to
//	play an animation frame that has been destroyed.
__AE_current_playing_animation = "";

//Get the length of the animation_map_keys DS_LIST
var animation_keys_length = ds_list_size(__AE_animation_map_keys);

//Loop through the animation_map_keys DS_LIST...
for(var i = 0; i < animation_keys_length; i++)
{
	//Grab a reference to the animation frames DS_LIST in animation_map DS_MAP 
	//	entry that corresponds with the animation_map_keys key at location i.
	var list_to_destroy = __AE_animation_map[? __AE_animation_map_keys[| i]]
	
	//Destroy the DS_LIST that we pulled above.
	ds_list_destroy(list_to_destroy);
}

//Destroy the DS_LIST that held all of the keys from the animation_map
ds_list_destroy(__AE_animation_map_keys);

//Destroy the DS_MAP animation_map
ds_map_destroy(__AE_animation_map);