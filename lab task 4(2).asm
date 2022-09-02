INCLUDE Irvine32.inc
.data
val1 WORD 1000h
val2 WORD 2000h
arrayB BYTE 10h,20h,30h,40h,50h
arrayW WORD 1000h,2000h,3000h
arrayD DWORD 10000000h,2000000h
.code
main PROC
; MOVZX
mov bx,0A69Bh
movzx eax,bx 			; EAX = 0000A69Bh
movzx edx,bl 			; EDX = 0000009Bh
movzx cx,bl 			; CX = 009Bh

; MOVSX
mov bx,0A69Bh
movsx eax,bx
movsx edx,bl 			
movsx cx,bl 			

; Memory-to-memory exchange:
mov ax,val1 		
xchg ax,val2 			
mov val1,ax 	

; Direct-Offset Addressing (byte array):
mov al,arrayB 		
mov al,[arrayB+1] 	
mov al,[arrayB+2] 	

; Direct-Offset Addressing (word array):
mov ax,arrayW 			
mov ax,[arrayW+2]		

; Direct-Offset Addressing (doubleword array):
mov eax,arrayD 		
mov eax,[arrayD+4] 		
exit
main ENDP
END main
