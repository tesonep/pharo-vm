ARM convenience instructions
subs: destReg rn: srcReg imm: immediate ror: rot
"	Remember the ROR is doubled by the cpu so use 30>>1 etc
	SUBS destReg, srcReg, #immediate ROR rot"

	^self type: 1 op: SubOpcode set: 1 rn: srcReg rd: destReg shifterOperand: ((rot>>1) <<8 bitOr: immediate)