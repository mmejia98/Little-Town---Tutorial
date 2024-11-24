/// @description Deal with Sequences

//Listen for Broadcast Messages
switch(event_data[? "message"]){
	case "sequenceStart": {
		//Set our state
		sequencesState = seqState.playing;
		//Find out which Sequence just broadcast this message and mark it
		if(layer_get_element_type(event_data[? "element_id"]) == layerelementtype_sequence){
			curSeq = event_data[? "element_id"];
			show_debug_message("obj_control has heard that sequence " + string(curSeq)+" is playing");
		}
	}; break;
	case "sequenceEnd": {
		//Set out state
		sequencesState = seqState.finished;
		show_debug_message("obj_control has heard that Sequence " + string(curSeq)+" has ended");
	};break;
}