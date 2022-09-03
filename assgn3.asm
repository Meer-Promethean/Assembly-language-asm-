include irvine16.inc
;.model small
;.stack 64h

.data
	
.code
	main proc
		;take input
		mov ah,1
		int 21h
		;show output
		mov dl,al
		mov ah,2
		;exit flow of program
		mov ah,4ch
		int 21h
		
	main endp

end main