INCLUDE Irvine32.inc;

.data
	; this Semicolon is used to comment out a statment single line
	Msg1 BYTE "Nothing is impossible, I am doing nothing.",0
	
	;It begins with COMMENT directive and a programmer-chosen character end with the same programmer-chosen character. E.g.
	COMMENT $
	this area we use for multiple line comment until the select charater end...
	////////////////////coal/////////////////
	[[[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]
	$
	
.code
	main PROC
	mov edx,OFFSET Msg1
	call WriteString
	exit
main ENDP
END main
