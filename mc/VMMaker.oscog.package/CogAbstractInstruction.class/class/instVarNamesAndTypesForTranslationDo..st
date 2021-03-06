translation
instVarNamesAndTypesForTranslationDo: aBinaryBlock
	"enumerate aBinaryBlock with the names and C type strings for the inst vars to include in an AbstractInstruction struct."
	"{CogAbstractInstruction. CogIA32Compiler. CogARMCompiler} do:
		[:c| Transcript print: c; cr. c printTypedefOn: Transcript]"
	(self filteredInstVarNames copyWithout: 'machineCode'), #('machineCode') do:
		[:ivn|
		ivn ~= 'bcpc' ifTrue:
			[aBinaryBlock
				value: ivn
				value: (ivn caseOf: {
							['address']			-> [#'unsigned long'].
							['machineCode']	-> [self machineCodeDeclaration].
							['operands']		-> [{#'unsigned long'. '[', NumOperands, ']'}].
							['dependent']		-> ['struct _AbstractInstruction *']}
						otherwise:
							[#'unsigned char'])]]