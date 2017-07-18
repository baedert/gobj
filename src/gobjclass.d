import std.stdio;
import std.algorithm;
import std.range;

import utils;

void generateClass() {
	string className;
	string classNameUppercase;
	string libPrefix;
	string libPrefixUppercase;
	string classPrefix;

	string classNameNoPrefix;
	string classNameNoPrefixUppercase;

	string parentClassName;

	write("Class Name: ");
	className = stdin.byLineCopy().take(1).front;
	write("Parent Class Name: ");
	parentClassName = stdin.byLineCopy().take(1).front;

	assert (className[0].uppercase);
	assert (parentClassName[0].uppercase);

	classNameUppercase = className.uppercasify;
	classPrefix = classNameUppercase.lowercasify;
	libPrefix = className.getPrefix ();

	foreach (char c; libPrefix)
		libPrefixUppercase ~= c.toupper;

	classNameNoPrefix = className[libPrefix.length..$];
	classNameNoPrefixUppercase = classNameNoPrefix.uppercasify;

	string type_macro = libPrefixUppercase ~ "_TYPE_" ~ classNameNoPrefixUppercase;


	static if(1) {
		writeln ("Parent class:          ", parentClassName);
		writeln ("Lib prefix:            ", libPrefix);
		writeln ("Lib prefix uppercase:  ", libPrefixUppercase);
		writeln ("Uppercase class name:  ", classNameUppercase);
		writeln ("Prefixless class name: ", classNameNoPrefix);
		writeln ("Class prefix:          ", classPrefix);
		writeln ("Prefixless class name: ", classNameNoPrefixUppercase);
	}

	writeln ("\n----- Header File -----\n");

	writeln ("#ifndef __" ~ classNameUppercase ~ "_H__");
	writeln ("#define __" ~ classNameUppercase ~ "_H__");
	writeln ("");
	writeln ("typedef struct _", className, "      ", className, ";");
	writeln ("typedef struct _", className, "Class ", className, "Class;");
	writeln ("");
	writeln ("#define ", type_macro, "           (", classPrefix, "_get_type ())");
	writeln ("#define ", classNameUppercase, "(obj)           (G_TYPE_CHECK_INSTANCE_CAST(obj, ", type_macro, ", ", className, "))");
	writeln ("#define ", classNameUppercase, "_CLASS(cls)     (G_TYPE_CHECK_CLASS_CAST(cls, ", type_macro, ", ", className, "Class))");
	writeln ("#define ", libPrefixUppercase, "_IS_", classNameNoPrefixUppercase, "(obj)        (G_TYPE_CHECK_INSTANCE_TYPE(obj, ", type_macro, "))");
	writeln ("#define ", libPrefixUppercase, "_IS_", classNameNoPrefixUppercase, "_CLASS(cls)  (G_TYPE_CHECK_CLASS_TYPE(cls, ", type_macro, "))");
	writeln ("#define ", libPrefixUppercase, "_",  classNameNoPrefixUppercase, "_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS(obj, ", type_macro, ", ", className, "Class))");

	writeln ("");
	writeln ("struct _", className);
	writeln ("{");
	writeln ("  ", parentClassName, " parent_instance;");
	writeln ("};");
	writeln ("");
	writeln ("struct _", className, "Class");
	writeln ("{");
	writeln ("  ", parentClassName, "Class parent_class;");
	writeln ("};");
	writeln ("");

	writeln ("GType ", classPrefix, "_get_type (void) G_GNUC_CONST;");

	writeln("\n\n#endif");


	writeln ("\n----- Source File -----\n");
	string parentClassPrefix = parentClassName.getPrefix ();
	string parent_classNoPrefix = parentClassName[parentClassPrefix.length..$];
	writeln ("G_DEFINE_TYPE(", className, ", ", classPrefix, ", ", parentClassPrefix.uppercasify, "_TYPE_",  parent_classNoPrefix.uppercasify, ")");

	writeln ("");
	writeln ("static void");
	writeln (classPrefix, "_init (", className, " *self)");
	writeln ("{");
	writeln ("");
	writeln ("}");
	writeln ("");

	writeln ("static void");
	writeln (classPrefix, "_class_init (", className, "Class *klass)");
	writeln ("{");
	writeln ("");
	writeln ("}");
}
