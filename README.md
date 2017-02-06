# GMS_Animation_Engine
Code-based animation engine for GameMaker Studio (2).  This allows you to assign sprite sheets to sprites and write in the animation frames.  This is particularly useful for animations in which you need to repeat frames multiple times such as idle animations.

Project includes commented example.

# How to Use
In object Create Event:
  1. Initialize the Animation Engine:
    init_animation(); //!!IMPORTANT
  2. Declare a few animations:
    create_animation("idle", [5], 0); //Animation name: idle    Animation frames: [5]   Animation FPS: 0
    create_animation("walk", [1,2,3,4,3,2], 20); //Animation name: walk   Animation frames: [1,2,3,4,3,2]    Animation FPS: 20
  3. Start the default animation:
    play_animation("idle");
    
In object Step Event:
  1. Receive input and change playing animation as necessary:
    if(keyboard_check_direct(vk_left)){ play_animation("walk"); image_xscale = -1;}
  2. Pause/Resume animation if you need to for any particular reason:
    pause_animation();
    resume_animation();
  3. At very bottom of Step Event have animation engine continue to process animations:
    play_animation(); //!!IMPORTANT
    
In object Destroy Event:
  1. Clean up all of the data structures associated with this object's Animation Engine:
    cleanup_animation(); //!!IMPORTANT
