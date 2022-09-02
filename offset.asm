INCLUDE irvine32.inc
.data
bval BYTE ?
wval WORD ?
dval DWORD ?
dval2 DWORD ?
dvalarray DWORD 5 DUP(?)
dvalarray DWORD 1,2,3,4,5
.code
main PROC
mov esi,OFFSET bval
call DumpRegs
mov esi,OFFSET wval
call Dumpregs
mov esi, dval
call DumpRegs
mov esi,dval2
call dumpregs
mov esi,OFFSET dValArray
call dumpregs
mov esi,OFFSET dValArray 
mov eax,[esi]
call DumpRegs
mov esi,OFFSET dValArray + 8 
mov eax,[esi]
call DumpRegs




exit
main ENDP
END main
