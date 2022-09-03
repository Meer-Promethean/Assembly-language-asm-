Include irvine32.inc

.data

	val1 DWORD ?
	val2 DWORD ?

.code
main PROC
	call readint
	mov val1, eax
	call readint
	mov val2,eax
	
	mov eax, val1	
	
	_while:
		cmp eax, val2 	
		jnl endwhile	
	
		inc eax		
		dec val2
	jmp _while

	endwhile:
		mov val1,eax
exit
main ENDP
END main
