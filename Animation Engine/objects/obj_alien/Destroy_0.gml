/// @description Cleanup animation engine.

//This must be run in the destroy event or you will end up with
//	data structures floating around in memory.  That would be bad.
cleanup_animation();