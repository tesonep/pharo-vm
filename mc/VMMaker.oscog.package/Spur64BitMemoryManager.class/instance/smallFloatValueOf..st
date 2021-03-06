interpreter access
smallFloatValueOf: oop
	"Answer the C double precision floating point value of the argument, a SmallFloat.
	 See section 61-bit Immediate Floats in the SpurMemoryManager class comment.
							msb                                              lsb 
	 Decode:				[8expsubset][52mantissa][1s][3tags] 
	 shift away tags:		[ 000 ][8expsubset][52mantissa][1s] 
	 add exponent offset:	[     11 exponent     ][52mantissa][1s] 
	 rot sign:				[1s][     11 exponent     ][52mantissa]"
	| bits |
	<returnTypeC: #double>
	bits := self smallFloatBitsOf: oop.
	^self cCode: [(self cCoerce: (self addressOf: bits) to: #'double *') at: 0]
		inSmalltalk:
			[(Float new: 2)
				at: 1 put: bits >> 32;
				at: 2 put: (bits bitAnd: 16rFFFFFFFF);
				* 1.0 "reduce to SmallFloat64 if possible"]