/// @description Deal with sequences by state

//Control Sequences
switch sequencesState {
	case seqState.playing: {
		global.playerControl = false;
	}; break;
	case seqState.finished: {
		//Remove Sequence
		if(layer_sequence_exists(curSeqLayer, curSeq)){
			layer_sequence_destroy(curSeq);
		}
		//Restore control to player, reset
		global.playerControl = true;
		sequencesState = seqState.notPlaying;
		curSeq = noone;
	}; break;
}
