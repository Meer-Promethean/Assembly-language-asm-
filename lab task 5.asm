INCLUDE Irvine32.inc

.data
array WORD 100h,200h,300h,400h

.code
main PROC

	mov  edi,OFFSET array		
	mov  ecx,LENGTHOF array
	mov  ax,0				

L1:
	add  ax,[edi]
	add  edi,TYPE array   	
	loop L1			
	exit
main ENDP
END main
