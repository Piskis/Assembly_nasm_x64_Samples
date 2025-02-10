section .bss
name resb 120

section .data
msg1 db "Hello name?", 10
len1 equ $ - msg1

msg2 db "name is ", 0
len2 equ $ - msg2

section .text
global _start

_start:
  ; Выводим "Hello name?"
  mov rax, 1
  mov rdi, 1
  mov rsi, msg1
  mov rdx, len1
  syscall 

  ; Читаем имя
  mov rax, 0
  mov rdi, 0
  mov rsi, name
  mov rdx, 119  ; Оставляем место для нуля
  syscall

  ; Выводим "name is "
  mov rax, 1
  mov rdi, 1
  mov rsi, msg2
  mov rdx, len2
  syscall

  ; Выводим введенное имя
  mov rax, 1
  mov rdi, 1
  mov rsi, name
  mov rdx, 119
  syscall

  ; Завершаем программу
  mov rax, 60
  xor rdi, rdi
  syscall

