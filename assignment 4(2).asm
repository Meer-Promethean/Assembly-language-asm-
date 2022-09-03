INCLUDE Irvine32.inc

.data
cursor_position COORD <>
str1 byte "Meer murtaza charan", 0
handle DWORD 0
var1 DWORD 0

.code
main proc

xor eax, eax
xor ebx, ebx
xor ecx, ecx

L_1 :
mov edx, offset str1
call writestring
mov eax, 80
call Delay
call Clrscr
jmp L_2
loop L_1

L_2:

INVOKE GetStdHandle, STD_OUTPUT_HANDLE
mov handle, eax
mov ax, bx
mov cursor_position.x, ax
mov eax, var1
mov cursor_position.y, ax
invoke SetConsoleCursorPosition, handle, cursor_position
inc bx
cmp bx, 66
mov ecx, 66
je L_3
jmp L_1

L_3 :
dec bx
INVOKE GetStdHandle, STD_OUTPUT_HANDLE
mov handle, eax
mov ax, bx
mov cursor_position.x, ax
mov eax, var1
mov cursor_position.y, ax
invoke SetConsoleCursorPosition, handle, cursor_position
mov edx, offset str1
call WriteString
mov eax, 80
call Delay
call clrscr
cmp bx, 1
je L_1
loop L_3

exit
main ENDP
end main