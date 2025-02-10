%macro print 2                  ; macro name is print(or whatever you want) and it took 2 arguments
; it can be any part of code
mov rax, 1
mov rdi, 1
mov rsi, %1                     ; first argument (will be msg)
mov rdx, %2                     ; second argument (will be a len of msg)
syscall 
%endmacro

section .data
msg1 db "Hello macro", 0, 10
len1 equ $ - msg1

section .text
global _start
_start:
  print msg1, len1              ; msg1 is %1 and len1 is %2 
; exit
  mov rax, 60
  xor rdi, rdi
  syscall 
