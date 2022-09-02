include irvine.inc
.data
myDouble DWORD 12345678h
myBytes BYTE 12h,34h,56h,78h
.code
main PROC
mov ax,WORD PTR myDouble		 
call DumpRegs

mov al,BYTE PTR myDouble 		
mov al,BYTE PTR [myDouble+1] 		
mov al,BYTE PTR [myDouble+2]		
mov ax,WORD PTR myDouble 		
mov ax,WORD PTR [myDouble+2] 	
mov ax,WORD PTR [myBytes] 		
mov ax,WORD PTR [myBytes+2] 	
mov eax,DWORD PTR myBytes 
exit
main ENDP
END main

