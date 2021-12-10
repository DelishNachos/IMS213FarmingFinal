// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function buy_seed(_seedType, amt){
	var invGrid = inventory.ds_inventory;
	var playGrid = inventory.ds_player_info;
	var itemGrid = inventory.ds_items_info;
	
	var emptySlot = 0;
	var isEmpty = false;
	
	var costAmt = itemGrid[# 2, _seedType] * amt;
	var totalMoney = (playGrid[# 1, 2]) + (playGrid[# 1, 1] * 100) + (playGrid[# 1, 0] * 1000);
	
	if (totalMoney < costAmt) exit;
	
	var yy = 0; repeat(ds_grid_height(invGrid)){
		if(invGrid[# 0, yy] == item.none){
			emptySlot = yy;
			isEmpty = true;
			break;
		}	
		yy++;
	}
	
	if (isEmpty == false) exit;
	
	invGrid[# 0, emptySlot] = _seedType;
	invGrid[# 1, emptySlot] = amt;
	
	if((playGrid[# 1, 2] - costAmt) < 0){
		repeat(5){
			playGrid[# 1, 1] -= 1;
			playGrid[# 1, 2] += 100;
			if(playGrid[# 1, 2] >= costAmt) break;
			if(playGrid[# 1, 1] = 0){
				playGrid[# 1, 0] -= 1;
				playGrid[# 1, 1] += 100;
			}
			
		}
		
	}
	
	playGrid[# 1, 2] -= costAmt;
	
}