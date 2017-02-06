/// @description Initialize animation engine, create animations.

//Initialize the animation engine.
init_animation();

//These animations are single frame, so we set the FPS to 0.
create_animation("duck",[1],0);
create_animation("idle",[2],0);
create_animation("hurt",[3],0);
create_animation("jump",[4],0);
create_animation("stand",[5],0);

//Walking animation has plenty of frames, we also want it to run at 20 FPS.
create_animation("walk",[6,7,8,9,10,11,12,13,14,15,16],20);

//Go ahead and make the default animation state the idle sprite.
play_animation("idle");