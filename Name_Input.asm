section .bss                              ; your variables 
Name resb 15                              ; how many place in Variable "Name"; now it 15 letters 

section .data 
Question db "What is your name?", 0, 10
Hello db "Hello "
LenH equ $ - Hello 
LenQ equ $ - Question 


section .text 
global _start 
_start: 
  mov rax, 1
  mov rdi, 1
  mov rsi, Question 
  mov rdx, LenQ
  syscall 

  mov rax, 0                              ; its take a user input 
  mov rdi, 0                              ; normal mode 
  mov rsi, Name                           ; where to save user input 
  mov rdx, 15                             ; how much user can input 
  syscall 

; Print Hello 

  mov rax, 1
  mov rdi, 1
  mov rsi, Hello
  mov rdx, LenH
  syscall 

; Print Name

  mov rax, 1
  mov rdi, 1
  mov rsi, Name                          
  mov rdx, 15
  syscall 

 ; its will print user input like Hello *name*  look at line 30 
 ; Also you can write on .data somsing like < newline db " ", 0, 10 > and print it to say Hello *name* \n 

  mov rax, 60
  xor rdi, rdi 
  syscall 

; if you dont understend somsing look at "Hello_World.asm"
