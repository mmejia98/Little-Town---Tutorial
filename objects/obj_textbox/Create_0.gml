/// @description Variables and setup

//Textbox variables
textToShow = "Put whatever text you like into string!";
textWidth = 450;
lineHeight = 28;
fadeMe = 0;
fadeSpeed = 0.1;
image_alpha = 0;
sequenceToShow = noone;

global.playerControl = false;

//Play UI sound
audio_play_sound(snd_pop01, 1, 0);

//Dismiss any invisible prompts
scr_dismissPrompt(obj_prompt, 0);