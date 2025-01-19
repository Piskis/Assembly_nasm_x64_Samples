section .text
global _start
_start:
  mov rbx, 5
  mov rdx, 3
  imul rbx, rdx               ; rdx * rbx 

  mov rax, 60
  xor rdi, rdi
  syscall 


