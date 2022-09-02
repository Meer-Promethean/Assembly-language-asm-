INCLUDE Irvine32.inc
.data
myarray WORD,100h,200h,300h,400h
.code
main PROC
	mov edi,OFFSET myarray
	mov ecx,LENGTHOF myarray
	mov ax,0
l1:
	add  ax,[edi]
	add  edi,TYPE myarray   		
	loop L1		 
	exit
main ENDP
END main
