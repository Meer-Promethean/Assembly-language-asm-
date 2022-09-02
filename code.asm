Include irvine32.inc
.data
	msg1 BYTE "Fuck you",0
.code
	main Proc
	mov edx,0
	mov edx,offset msg1
	call writestring
	call crlf
	exit
	
main Endp
end main