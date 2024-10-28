// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_itemPosition(){
	var _x, _y, _depth;
	if(instance_exists(obj_player)){
		switch obj_player.dir {
			case 0: { //right
				_x = obj_player.x + 65;
				_y = obj_player.y - 112;
				_depth = obj_player.depth - 2;
			}; break;
			case 1: { //up
				_x = obj_player.x;
				_y = obj_player.y - 95;
				_depth = obj_player.depth + 2;
			}; break;
			case 2: { //left
				_x = obj_player.x - 65;
				_y = obj_player.y - 112;
				_depth = obj_player.depth - 2;
			}; break;
			case 3: { //down
				_x = obj_player.x;
				_y = obj_player.y - 95;
				_depth = obj_player.depth - 2;
			}; break;
		}
		return [_x, _y, _depth];
	}
}