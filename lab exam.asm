#include irvine32.inc
.data
nl db 0dh 0ab, '$'

.code
mov cx,5
mov bx, 1

do_row
push cx
mov dl,20h
mov ah ,2 
do spaces:
int 21h
loop do_spaces
mov cx,bx
mov dl,'1'
mov ah,2
do stars:
int 21h
loop_stars
do_newline:
lea dx,nl
mov ah,9
int 21h
inc bx
inx dx
inc cx
loop do_row
mov ah,4ch
int 21h
loop do_stars
do_newline:
lea dx,nl
mov ah,9
int 21h
inc bx
inc dx
inc cx
loop do_row
mov ah,4ch
int 21h
exit
main ENDP
END main