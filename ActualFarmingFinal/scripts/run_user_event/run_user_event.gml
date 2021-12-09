// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function run_user_event(_id, userEventNum, _variable){
	with(_id){
		variableStored2 = _variable
		switch (userEventNum){
			case 0: event_perform(ev_other, ev_user0); break;
			case 1: event_perform(ev_other, ev_user1); break;
			case 2: event_perform(ev_other, ev_user2); break;
			case 3: event_perform(ev_other, ev_user3); break;
			case 4: event_perform(ev_other, ev_user4); break;
			case 5: event_perform(ev_other, ev_user5); break;
			case 6: event_perform(ev_other, ev_user6); break;
			case 7: event_perform(ev_other, ev_user7); break;
		}
	}
}