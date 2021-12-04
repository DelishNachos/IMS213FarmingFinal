speakerName = names[page];
voice = voices[page];
portraitIndex = portraits[page];

if(!is_array(text[page])) {
	textWrapped = string_wrap(text[page], textMaxWidth);
	strLength = string_length(textWrapped);
	choiceDialogue = false;
} else {
	textArray = text[page]
	textArrayLength = array_length(textArray);
	choiceDialogue = true;
}
counter = 0;