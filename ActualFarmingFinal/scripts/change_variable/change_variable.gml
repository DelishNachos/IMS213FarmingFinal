// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function change_variable(_id, _name, _value){
	with(_id)
		variable_instance_set(id, _name, _value);
}