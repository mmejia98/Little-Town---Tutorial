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