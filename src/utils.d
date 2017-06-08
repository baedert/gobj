bool uppercase(char c) {
	return c >= 'A' && c <= 'Z';
}

bool lowercase(char c) {
	return !c.uppercase;
}

char toupper(char c) {
	if (c.uppercase)
		return c;

	return cast(char)(c - 32);
}

char tolower(char c) {
	if (c.lowercase)
		return c;

	return cast(char)(c + 32);
}

string uppercasify(string input) {
	string back;

	assert (input.length > 0);
	assert (input[0].uppercase);

	back ~= input[0];

	for (size_t i = 1; i < input.length; i ++) {
		char c = input[i];

		if (c.uppercase) {
			back ~= '_';
		}

		back ~= c.toupper;
	}

	return back;
}
unittest {
	assert ("GtkApplication".uppercasify == "GTK_APPLICATION");
}

string lowercasify(string input) {
	string back;

	assert (input.length > 0);

	for (size_t i = 0; i < input.length; i ++) {
		char c = input[i];
		if (c == '-')
			back ~= '_';
		else
			back ~= c.tolower;
	}

	return back;
}

string getPrefix(string input) {
	string prefix;
	uint nUppercase = 0;
	for (size_t i = 0; i < input.length; i ++) {
		char c = input[i];

		if (c.uppercase) {
			nUppercase ++;
		}

		if (nUppercase == 2) {
			prefix = input[0..i];
			break;
		}
	}

	return prefix;
}

//string camelCasify(string input) {

//}
