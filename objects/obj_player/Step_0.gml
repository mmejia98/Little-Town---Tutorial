/// @description Player movement

//Check keys for movement
if(global.playerControl == true){
	moveRight = keyboard_check(vk_right);
	moveLeft = keyboard_check(vk_left);
	moveUp = keyboard_check(vk_up);
	moveDown = keyboard_check(vk_down);
}
if(global.playerControl == false){
	moveRight = 0;
	moveLeft = 0;
	moveUp = 0;
	moveDown = 0;
}

// Calculate movement
vx = ((moveRight - moveLeft) * walkSpeed);
vy = ((moveDown - moveUp) * walkSpeed);

//If idle
if(vx == 0 && vy == 0){
	// change idle sprite based on last direction
	switch dir{
		case 0: sprite_index = spr_player_idle_right; break;
		case 1: sprite_index = spr_player_idle_up; break;
		case 2: sprite_index = spr_player_idle_left; break;
		case 3: sprite_index = spr_player_idle_down; break;
	}
}

//If movement
if(vx != 0 || vy != 0){
	if !collision_point(x+vx, y, obj_par_environment, true, true) {
		x += vx;
	}
	if !collision_point(x, y+vy, obj_par_environment, true, true) {
		y += vy;
	}
	
	//Change walking Sprite based on direction
	//right
	if(vx > 0){
		sprite_index = spr_player_walk_right;
		dir = 0;
	}
	//left
	if(vx < 0){
		sprite_index = spr_player_walk_left;
		dir = 2;
	}
	//down
	if(vy > 0){
		sprite_index = spr_player_walk_down;
		dir = 3;
	}
	//up
	if(vy < 0){
		sprite_index = spr_player_walk_up;
		dir = 1;
	}
	
	//Move audio listener with me
	audio_listener_set_position(0,x,y,0);
}

//check for collision with NPCs
nearbyNPC = collision_rectangle(x-lookRange, y-lookRange, x+lookRange, y+lookRange, obj_par_npc, false, true);
if(nearbyNPC){
	//do something
	if(hasGreeted == false){
		audio_play_sound(snd_greeting01, 1, 0);
		hasGreeted = true;
	}
	//Pop up prompt
	if(npcPrompt == noone || npcPrompt == undefined){
		npcPrompt = scr_showPrompt(nearbyNPC, nearbyNPC.x, nearbyNPC.y-450);
	}
	show_debug_message("obj_player has found an NPC");
}
if(!nearbyNPC){
	//Reset greeting
	if(hasGreeted == true){
		hasGreeted = false;
	}
	//Get rid of prompt
	scr_dismissPrompt(npcPrompt, 0);
	show_debug_message("obj_player hasn't found anything");
}

//Depth sorting
depth = -y;

