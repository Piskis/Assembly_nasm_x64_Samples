section .data
msg db "Text 10 times!", 0, 10
len equ $ - msg

section .text
global _start
_start:
  mov rbx, 0
  jmp _loop

_loop:
  add rbx, 1
  cmp rbx, 10
  jl _text                  ; jump if lower
  jg _exit                  ; jump if greater

_text:
  mov rax, 1
  mov rdi, 1
  mov rsi, msg
  mov rdx, len
  syscall 
  jmp _loop

_exit:
  mov rax, 60
  xor rdi, rdi
  syscall 
