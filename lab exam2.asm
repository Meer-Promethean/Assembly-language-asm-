#INCLUDE irvine32.nec
.data

        ; Declare test matrices
matrixA DQ 4                    ; ROWS
        DQ 4                    ; COLS
        DQ 1, 2, 3, 10              ; 1st row
        DQ 4, 5, 6, 11           ; 2nd row
        DQ 13, 14, 15, 16
        DQ 18, 19, 20, 21

matrixB DQ 4                    ; ROWS
        DQ 4                    ; COLS
        DQ 1, 2, 11, 14                 ; 1st row
        DQ 3, 4, 66, 44                 ; 2nd row
        DQ 5, 6, 77, 99                 ; 3rd row

matrixC DQ 4                    
        DQ 4                    
        DQ 0, 0, 0, 0                 
        DQ 0, 0, 0, 0    
        DQ 0, 0, 0, 0
        DQ 0, 0, 0, 0

; ---------------------------------------------------------------------



octetbuffer     DQ 0    


.code
main PROC:
          mov  rax, matrixA     
          push rax              
          call matrix_print     
          add  rsp, 8

          mov  rax, matrixB    
          push rax
          call matrix_print
          add  rsp, 8

          mov  rax, matrixB     
          push rax
          mov  rax, matrixA
          push rax
          mov  rax, matrixC
          push rax
          call matrix_mult
          add  rsp, 24          

          mov  rax, matrixC     
          push rax
          call matrix_print
          add  rsp, 8

          call os_return               

matrix_print:                  
         push rbp               
         mov  rbp, rsp

         push rax               
         push rbx               
         push rcx               
         push rdx               
         push r15               
         push r14               
         push r13               
         
         mov rax, [rbp + 16]    

         mov rbx, [rax]         

         mov rcx, [rax + 8]     

         call output_newline    
         mov rdx, 0             

         printRowLoop:
            cmp rdx, rbx        
            jge printRowLoopEnd 

            mov r15, 0          
            printColumnLoop:
                cmp r15, rcx              
                jge printColumnLoopEnd    
                call output_tab           

                mov  r14, 8               
                imul r14, rcx             
                imul r14, rdx             
                add  r14, 16              
                add  r14, rax             

                mov  r13, 8              
                imul r13, r15             

                add  r14, r13             

                push qword [r14]
                call output_int           

                add r15, 1                

                jmp printColumnLoop       

            printColumnLoopEnd:
                call output_newline
                add rdx, 1
                jmp printRowLoop

         printRowLoopEnd:       
            pop r13
            pop r14
            pop r15
            pop rdx
            pop rcx
            pop rbx
            pop rax

         pop  rbp               
         ret



matrix_mult:                    

         push rbp                
         mov  rbp, rsp

         pop  rbp                
         ret




              

output_char:                    
        push rax
        push rbx
        push rcx
        push rdx
        push r8               
        push r9
        push r10
        push r11
        push qword [octetbuffer] 

        mov  rax, WRITE         
        mov  rbx, STDOUT        
        mov  rcx, [rsp+80]      
        mov  [octetbuffer], rcx 
        lea  rcx, [octetbuffer] 
        mov  rdx, 1             
        int  LINUX              

        pop qword [octetbuffer]
        pop  r11
        pop  r10
        pop  r9
        pop  r8
        pop  rdx
        pop  rcx
        pop  rbx
        pop  rax
        ret

; ------------------------

output_newline:                 
       push qword LF
       call output_char
       add rsp, 8
       ret

; ------------------------

output_tab:                     
       push qword TAB
       call output_char
       add  rsp, 8
       ret


output_minus:                   
       push qword MINUS
       call output_char
       add  rsp, 8
       ret

output_int:                     
       push rbp
       mov  rbp, rsp

       

       push rax                
       push rbx
       push rdx

       cmp  qword [rbp+16], 0
       jge  L88

       call output_minus
       neg  qword [rbp+16]

L88:
       mov  rax, [rbp+16]       
       mov  rdx, 0          
       mov  rbx, 10
       idiv rbx                

       cmp  rax, 0              
       je   L9

       push rax                
       call output_int
       add  rsp, 8

L99:
       add  rdx, '0'          
       push rdx
       call output_char
       add  rsp, 8

       pop  rdx                
       pop  rbx
       pop  rax
       pop  rbp
       ret
exit
main ENDP
END main