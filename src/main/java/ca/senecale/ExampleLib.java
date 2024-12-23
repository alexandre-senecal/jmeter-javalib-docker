package ca.senecale;

import org.slf4j.Logger;

public class ExampleLib {

	public static String exampleLibToCallFromJMeter(final Logger log) {
		// For the build to work you need at least one class in your Java project.
		return "Here is the call from ExampleLib.exampleLibToCallFromJMeter";
	}
}
