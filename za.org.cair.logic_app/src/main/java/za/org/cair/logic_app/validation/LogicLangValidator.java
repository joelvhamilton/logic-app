/*
 * generated by Xtext 2.24.0
 */
package za.org.cair.logic_app.validation;

import org.eclipse.xtext.validation.Check;
import org.eclipse.xtext.validation.CheckType;
import org.eclipse.xtext.validation.ComposedChecks;

import za.org.cair.logic_app.logicLang.Command;
import za.org.cair.logic_app.logicLang.Implication;
import za.org.cair.logic_app.logicLang.JustParseCommand;
import za.org.cair.logic_app.logicLang.LogicLangPackage;
import za.org.cair.logic_app.logicLang.Model;

/**
 * This class contains custom validation rules. 
 *
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#validation
 */
// all other validators listed here
@ComposedChecks(validators = {CommandValidator.class, VariantValidator.class})
public class LogicLangValidator extends AbstractLogicLangValidator {

	// List all validation issue codes here:
	public static final String NO_PROPOSITIONS = "noPropositions";
	public static final String NO_COMMANDS = "noCommands";
	public static final String INCONSISTENT_SYMBOLOGY = "inconsistentSymbology";

	@Check(CheckType.NORMAL) // only check at build-time
	public void checkForPropositions(Model model) {
		if (model.getPropositions().size() == 0) {
			warning("No propositions specified. No input to work on.",
					// Note: LogicLangPackage stuff is auto-generated from the grammar
					LogicLangPackage.Literals.MODEL__PROPOSITIONS,
					LogicLangValidator.NO_PROPOSITIONS);
		}
	}
	
}
