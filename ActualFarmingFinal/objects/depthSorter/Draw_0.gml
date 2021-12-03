var instNum = instance_number(parDepthObj);
var dgrid = ds_depthgrid;

if(ds_grid_height(ds_depthgrid) != instNum){
	ds_grid_resize(dgrid, 2, instNum);
}


var yy = 0; with(parDepthObj){
	dgrid[# 0, yy] = id;
	dgrid[# 1, yy] = y;
	yy += 1;
}

ds_grid_sort(dgrid, 1, true);

var inst; yy = 0; repeat(instNum){
	inst = dgrid[# 0 , yy];
	
	with(inst){
		event_perform(ev_draw, 0);	
	}
	
	yy += 1;
}