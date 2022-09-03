Include irvine32.inc

.data
msgStr BYTE "if with Logical AND is executed",0
val1 DWORD ?
val2 DWORD ?
val3 DWORD ?
X BYTE ?
Y BYTE ?

.code
main PROC
	call readint
	mov val1, eax
	
	call readint
	mov val2,eax
	
	call readint
	mov val3,eax
	
	mov eax, val1
	cmp eax, val2
	
	jbe next
		mov eax, val2

		cmp eax, val3

		jbe next

		mov edx, OFFSET msgStr
		call WriteString
		call crlf
		mov X, 1
		mov Y, 2
next:

exit
main ENDP
END main
