primitives-FT2Face
primitiveRenderGlyphIntoForm: formOop renderMode: mode
	"Render this face into the given form"
	| faceOop face bitmap |
	
	<var: #face type: 'FT_Face'> "pointer"
	<var: #bitmap type: 'FT_Bitmap'> "temp struct"
	
	faceOop := self 
				primitive: 'primitiveRenderGlyphIntoFormWithRenderMode'
				parameters: #(Form SmallInteger)
				receiver: #FT2Face.
	face := self ftHandleValueFromReceiver: faceOop.
	face isNil ifTrue: [^interpreterProxy primitiveFail].

	self ftInitBitmap: (self cCode: '&bitmap' inSmalltalk: [bitmap := nil]) fromForm: formOop renderMode: mode.
	interpreterProxy failed ifTrue: [^nil].

	errorCode := self cCode: 'FT_Outline_Get_Bitmap(library, &face->glyph->outline, &bitmap)' inSmalltalk: [self touch: bitmap].
	interpreterProxy success: errorCode == 0