/// @description Handle input to change animations.

//If player presses down, set to standing animation.
if(keyboard_check_direct(vk_down)) play_animation("stand");

//If player presses left, set to walking animation and flip horizontally.
if(keyboard_check_direct(vk_left)){ play_animation("walk"); image_xscale = -1;}

//If player presses right, set to walking animation.
if(keyboard_check_direct(vk_right)){ play_animation("walk"); image_xscale = 1;}

//If player presses spacebar, set to jumping animation.
if(keyboard_check_direct(vk_space)) play_animation("jump");




//Continue to process animations.
play_animation();