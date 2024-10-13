/// @description Textbox test

var _text;

//Create textbox if NPC is nearby
if(nearbyNPC && global.playerControl == true){
	_text = nearbyNPC.myText;
	if(!instance_exists(obj_textbox)) {
		iii = instance_create_depth(x, y, -10000, obj_textbox);
		iii.textToShow = _text;
	}
}