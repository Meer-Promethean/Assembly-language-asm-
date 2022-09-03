Include irvine32.inc

.data
	msgStr BYTE "Both numbers are equal, if statement executed",0
	op1 DWORD 12345678h
	op2 DWORD 12345678h
	X BYTE ?
	Y BYTE ?

.code
main PROC

mov eax, op1
cmp eax, op2	

je L1		
jmp L2	

L1:
	Mov edx, OFFSET msgStr
	call WriteString
	call crlf
	mov X, 1
	mov Y, 2

L2:
exit
main ENDP
END main
