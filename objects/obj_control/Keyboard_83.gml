/// @description Test sequence

//Set sequence to center of Camara view
var _camX = camera_get_view_x(view_camera[0])+floor(camera_get_view_width(view_camera[0])*0.5);
var _camY = camera_get_view_y(view_camera[0])+floor(camera_get_view_height(view_camera[0])*0.5);

//Create Sequence on the proper layer
if!(layer_sequence_exists(curSeqLayer, seq_baker_happy.id)){
	if(layer_exists(curSeqLayer)){
		layer_sequence_create(curSeqLayer, _camX, _camY, seq_baker_happy);
		//Make sure Cutscenes layer if above the action
		layer_depth(curSeqLayer, -10000);
	}
}