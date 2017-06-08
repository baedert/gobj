import std.stdio;
import std.range;
import std.algorithm;

import utils;

enum PropertyType {
	STRING,
	BOOL,
	ENUM,
	INT,
	OBJECT
}
PropertyType typeFromString(string foo) {
	switch(foo) {
		case "int":
			return PropertyType.INT;
		case "string":
			return PropertyType.STRING;
		case "enum":
			return PropertyType.ENUM;
		case "bool":
			return PropertyType.BOOL;
		default:
			return PropertyType.OBJECT;
	}
}

string toCType(PropertyType t) {
	switch(t) {
		case PropertyType.INT:
			return "int";
		case PropertyType.ENUM:
			return "foo";
		default:
			return "gpointer";
	}
}

void generateProperty() {
	string propertyName;
	string propertyType;
	string className;
	PropertyType propType;

	static if (0) {
	write("Property Name: ");
	propertyName = stdin.byLineCopy().take(1).front;
	write("Property Type: ");
	propertyType = stdin.byLineCopy().take(1).front;
	write("Class Name: ");
	className = stdin.byLineCopy().take(1).front;
	} else {
		propertyName = "icon-name";
		propertyType = "string";
		className = "GtkButton";
	}

	propType = typeFromString(propertyType);

	string classNameUppercase = className.uppercasify;
	string classPrefix = classNameUppercase.lowercasify;
	string propertyNameLowerCase = propertyName.lowercasify;

	writeln("          Property name: ", propertyName);
	writeln("Lowercase Property Name: ", propertyNameLowerCase);
	writeln("   Uppercase class name: ", classNameUppercase);
	writeln("             Class Name: ", className);
	writeln("           Class prefix: ", classPrefix);



	writeln("-------- Header File --------");
	writeln("void " ~ classPrefix ~ "_set_" ~ propertyNameLowerCase ~ " (" ~ className ~ " *self);");

	writeln("");
	writeln("-------- Source File --------");
}
