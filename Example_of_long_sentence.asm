section .data
msg1 db "First looooong sentence", 0, 10            ; 0, 10 means \n (newline) you can remove it to have result "One And Two"
     db "And second weeeryyyyyy looong sentence", 0, 10
     db "And of this looooooong text ", 0, 10

; if all this text will be at one line it will be strange, of this we can do somsing like this

len1 equ $ - msg1

section .text
global _start
_start:
    mov rsi, msg1
    mov rdx, len1
    jmp _say                    ; is an exaple hov to simplificate your work to not write every time rax, rdi and syscall

_say: 
    mov rax, 1
    mov rdi, 1
    syscall
    jmp _exit
    
_exit:
    mov rax, 60
    xor rdi, rdi
    syscall 
