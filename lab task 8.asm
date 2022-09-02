INCLUDE Irvine32.inc 

.data
msg1 byte "Both  numbers are equal",0
msg2 byte "Both numbers are un-equal",0

op1 DWORD 25h
op2 DWORD 25h

x1 byte ?
y1 byte ?

msgStr1 BYTE "If with Logical AND is executed",0

val1 DWORD ?
val2 DWORD ?
val3 DWORD ?

X BYTE ?
Y BYTE ?

msgStr BYTE "If with Logical OR is executed",0

val4 DWORD ?
val5 DWORD ?
val6 DWORD ?
X11 BYTE 	?

valq DWORD ?
valw DWORD ?

.code
main PROC

	xor eax,eax
	xor edx,edx
	mov eax,op1
	cmp eax,op2

je l1

jmp l2

l1:
	mov edx,offset msg1
	call writestring
	call crlf

	mov x1,1
	mov y1,2

l2:



	xor eax,eax
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




	call readint
	mov val4, eax
	
	call readint
	mov val5,eax
	
	call readint
	mov val6,eax
	
	mov eax, val4
	cmp eax, val5
	
	ja Ll		
		mov eax, val5
		cmp eax, val6
		
		jbe zext
		
	Ll:	mov X11, 1
		mov edx, OFFSET msgStr1
		call WriteString
		call Crlf
	zext:




	call readint
	mov valq, eax
	call readint
	mov valw,eax
	
	mov eax, valq	
	
	_while:
		cmp eax, valw 	
		jnl endwhile	
	
		inc eax		
		dec valw	
	jmp _while

	endwhile:
		mov valq,eax


exit
main ENDP
END main