/// @description Game variables

//Game variables
global.playerControl = true;
townBGMvolume = audio_sound_get_gain(snd_townBGM);
townAmbienceVolume = audio_sound_get_gain(snd_townAmbience);
global.gameOver = false;
global.gameStart = false;

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

//NPC states
enum npcState {
	normal,
	done
}
