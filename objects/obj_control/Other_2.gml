/// @description Game variables

//Game variables
global.playerControl = true;

//Player States
enum playerState {
	idle,
	walking,
	pickingUp,
	carrying,
	carryIdle,
	puttingDown,
}

//Item states
enum itemState {
	idle,
	taken,
	used,
	puttingBack,
}

//Sequence States
enum seqState {
	notPlaying,
	waiting,
	playing,
	finished
}

//Sequence variables
sequencesState = seqState.notPlaying;
curSeqLayer = noone;
curSeq = noone;