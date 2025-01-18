section .text
global _start 
_start:
  mov rbx, 1                        ; mov rbx <-- 1 
  add rbx, 2                        ; add rbx <-- 2
  ; now on rbx is 3

  mov rax, 60
  xor rdi, rdi
  syscall 
