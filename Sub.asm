section .text 
global _start
_start:
  mov rbx, 2                    ; mov rbx <-- 2
  sub rbx, 1                    ; rbx - 1 = 1
  syscall 

; finish 

  mov rax, 60
  xor rdi, rdi
  syscall 


