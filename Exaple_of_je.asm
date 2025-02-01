section .data
msg db "Hello 5 times", 0, 10
len equ $ - msg

section .text
global _start
_start:
  mov rbx, 0

_loop: 
  add rbx, 1
  cmp rbx, 5
  jl _print
_print:
  mov rax, 1
  mov rdi, 1
  mov rsi, msg
  mov rdx, len 
  syscall 
  jmp _loop
