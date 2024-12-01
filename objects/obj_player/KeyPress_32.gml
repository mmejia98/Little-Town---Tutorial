/// @description Textbox test

var _text, _seq;

//If play has control
if(global.playerControl == true){
	//If near an NPC
	if(nearbyNPC){
		//If NPC is still available
		if(nearbyNPC.myState == npcState.normal){
			//If Player does not have an item
			if(hasItem == noone || hasItem == undefined){
				_text = nearbyNPC.myText;
				if(!instance_exists(obj_textbox)){
					iii = instance_create_depth(nearbyNPC.x, nearbyNPC.y-400, -10000, obj_textbox);
					iii.textToShow = _text;
				}
			}
			//If player has item (and it still exists)
			if(hasItem != noone && instance_exists(hasItem)){
				//If player has correct item
				if(hasItem.object_index == nearbyNPC.myItem){
					_text = nearbyNPC.itemTextHappy;
					_seq = nearbyNPC.sequenceHappy;
					//Check if we should remove item, mark
					alarm[1] = 10;
				}
				//Or if player has incorrect item
				else{
					_text = nearbyNPC.itemTextSad;
					_seq = nearbyNPC.sequenceSad;
				}
				//Create textbox
				if(!instance_exists(obj_textbox)){
					iii = instance_create_depth(nearbyNPC.x, nearbyNPC.y-400, -10000, obj_textbox);
					iii.textToShow = _text;
					iii.sequenceToShow = _seq;
				}
			}	
		}
		//If NPC is "done"
		if(nearbyNPC.myState == npcState.done){
			_text = nearbyNPC.itemTextDone;
			if(!instance_exists(obj_textbox)){
				iii = instance_create_depth(nearbyNPC.x, nearbyNPC.y-400,-10000,obj_textbox);
				iii.textToShow = _text;
			}
		}
	}
	//If near an item
	if(nearbyItem && !nearbyNPC){
		//If player doesn't have an item
		if(hasItem == noone || hasItem == undefined){
			global.playerControl = false;
			myState = playerState.pickingUp;
			image_index = 0;
			hasItem = nearbyItem;
			//Taken into account weight of the item we're picking up
			carryLimit = hasItem.itemWeight * 0.1;
			//Change state of item we're picking up
			with(hasItem){
				myState = itemState.taken;
			}
			//Play pickup sound
			audio_play_sound(snd_itemPutDown, 1, 0);
		}
	}
	//If not near an NPC or another item
	if(!nearbyItem && !nearbyNPC){
		//Put down an item
		if(hasItem != noone){
			myState = playerState.puttingDown;
			image_index = 0;
			global.playerControl = false;
			//Change state of item we were carrying
			with(hasItem){
				putDownY = obj_player.y + 5;
				myState = itemState.puttingBack;
			}
			//Play put-down sound
			audio_play_sound(snd_itemPutDown, 1, 0);
			//Reset item
			hasItem = noone;
		}
	}
}