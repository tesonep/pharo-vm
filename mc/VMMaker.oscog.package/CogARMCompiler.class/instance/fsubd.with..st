ARM convenience instructions
fsubd: destReg with: srcReg
"FSUBD or VSUB instruction to subtract double srcReg from double destREg and stick result in double destReg
ARM_ARM v5 DDI 01001.pdf pp. C4-112"
	<inline: true>
	^((2r11101110001100000000101101000000 bitOr: destReg<<16 ) bitOr: destReg<<12) bitOr: srcReg