/// @description sorting and other

//Depth, animation
switch myState {
	//If Item is sittin on the ground
	case itemState.idle: {
		depth = -y;
	}; break;
	//If item has been taken
	case itemState.taken: {
		//Keep track of player position
		var _result = scr_itemPosition();
		x = _result[0];
		y = _result[1];
		depth = _result[2];
	};break;
	//If item is being put back
	case itemState.puttingBack: {
		y = putDownY;
		myState = itemState.idle;
	}; break;
}



