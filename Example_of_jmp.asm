section .data
msg db "Hello"
len equ $ - msg 

section .text
global _start
_start:
  mov rsi, msg
  mov rdx, len 
  jmp _print
  ; After "print" program will jamp to exit
  jmp _exit

_print:
  mov rax, 1
  mov rdi, 1
  syscall 

_exit: 
  mov rax, 60
  xor rdi, rdi
  syscall 
