import std.stdio;

import utils;
import gobjclass;
import property;



void main(string[] args)
{
	enum Action {
		CLASS,
		PROPERTY
	}

	if (args.length != 2) {
		writeln("Need exactly one argument: what to generate.");
		writeln("Possibilities: class, property");
		return;
	}

	Action action;
	if (args[1] == "class") {
		action = Action.CLASS;
	} else if (args[1] == "property") {
		action = Action.PROPERTY;
	} else {
		writeln("Unknown '", args[1], "' paramter.");
		return;
	}

	switch(action) {
		case Action.CLASS:
			generateClass();
		break;

		case Action.PROPERTY:
			generateProperty();
		break;

		default: assert(0);
	}
}
