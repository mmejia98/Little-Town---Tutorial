/// @description Deal with sequences by state

//Control Sequences
switch sequencesState {
	case seqState.playing: {
		//Fade out town music
		if(audio_is_playing(snd_townBGM)){
			audio_sound_gain(snd_townBGM, 0, 60);
		}
		//Fade out town ambience
		if(audio_is_playing(snd_townAmbience)){
			audio_sound_gain(snd_townAmbience, 0, 60);
		}
		global.playerControl = false;
	}; break;
	case seqState.finished: {
		//Remove Sequence
		if(layer_sequence_exists(curSeqLayer, curSeq)){
			layer_sequence_destroy(curSeq);
		}
		//Restore town music
		if(audio_is_playing(snd_townBGM) && audio_sound_get_gain(snd_townBGM) < townBGMvolume){
			audio_sound_gain(snd_townBGM, townBGMvolume, 60);
		}
		//Fade out town ambience
		if(audio_is_playing(snd_townAmbience) && audio_sound_get_gain(snd_townAmbience) < townAmbienceVolume){
			audio_sound_gain(snd_townAmbience, townAmbienceVolume, 60);
		}
		//Restore control to player, reset
		global.playerControl = true;
		sequencesState = seqState.notPlaying;
		curSeq = noone;
		
		//Check if NPC are "done"
		if(global.gameOver == false){
			if(instance_exists(obj_npc_baker) && instance_exists(obj_npc_teacher) && instance_exists(obj_npc_grocer)){
				if(obj_npc_baker.myState == npcState.done && obj_npc_teacher.myState == npcState.done && obj_npc_grocer.myState == npcState.done){
					//Queue up "game over" sequence
					global.playerControl = false;
					alarm[0] = 60;
					//Mark game as won
					global.gameOver = true;
				}
			}
		}
		
	}; break;
}
