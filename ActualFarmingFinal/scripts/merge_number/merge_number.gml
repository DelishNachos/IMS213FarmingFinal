function merge_number(num1, num2, amount){
	var diff = num1 - num2;
	var merged = num1 - (diff * amount);
	
	return merged;
}