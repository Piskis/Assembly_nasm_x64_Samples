section .data                             ; here will be all you Constants
msg1 db "Hello World!", 0, 10             ; msg1 can be any other name; 0, 10 is a newline on assembly 
len1 equ $ - msg1                         ; len1 is the lenght of the string starting at msg1

section .text                             ; Execution of code
global _start                             
_start:                                   ; start of code 
                                          ; mov  rax <-- 1   ist mean mov in rax 1, no rax to 1
  mov rax, 1                              ; normaly "print" funcion
  mov rdi, 1                              ; in normal mode
  mov rsi, msg1                           ; mov to rsi msg1; this is what program will write 
  mov rdx, len1                           ; or it can be number of all simbols like 12 in Hello World!
  syscall                                 ; Without it program will ignore this part 

  mov rax, 60                             ; exit program / finish
  xor rdi, rdi                            ; like mov rdi, 0 but more fast and it takes less memory / code of exit 0
  syscall 


