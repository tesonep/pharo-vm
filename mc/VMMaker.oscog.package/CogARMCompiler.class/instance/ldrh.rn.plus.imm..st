ARM convenience instructions
ldrh: destReg rn: baseReg plus: u imm: immediate8bitValue
"	LDRH destReg, [baseReg, 'u' immediate8bitValue] u=0 -> subtract imm; =1 -> add imm "
	^self memM16xr: AL reg: destReg  base: baseReg p: 1 u: u  w: 0 l: 1 offset: immediate8bitValue