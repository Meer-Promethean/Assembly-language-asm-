INCLUDE Irvine32.inc

.data

.code
main PROC

	XOR EAX,EAX
	XOR EBX,EBX
	XOR ecx,ecx
	XOR ebx,ebx

	mov ebx,11d
	mov ecx,11d
	mov edx,ebx
	
	L1:
		mov eax,ecx
		call WriteInt
		call Crlf
	LOOPNZ L1 		; loop until ECX>0

	mov ecx , 11 		; loop counter for LOOPE
	
	L2:
		mov eax,ecx
		neg eax
		call WriteInt
		call Crlf
	LOOPNE L2
	
	exit
main ENDP
END main