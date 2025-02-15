%macro print 2                                         ; well just funcions 
mov rax, 1
mov rdi, 1
mov rsi, %1
mov rdx, %2
syscall
%endmacro

%macro name_input 1
mov rax, 0
mov rdi, 0
mov rsi, %1
mov rdx, 256
syscall
%endmacro

section .data                                          ; text thats we will see
Hello1 db "Filename:", 0, 10
len1 equ $ - Hello1
Hello2 db "Text:", 0, 10
len2 equ $ - Hello2

section .bss                              
filename resb 256                                      ; Name of our file 
msg resb 256                                           ; text in file
fd resq 1                                              ; Helps to write file 

section .text
global _start
_start:
  
  print Hello1, len1 
  name_input filename 

  call kill_newline
  
  print Hello2, len2 
  name_input msg
  
  
  mov rax, 2                                           ; sys-open
  mov rdi, filename                                    ; our file
  mov rsi, 0x241                                       ; open file
  mov rdx, 0o644                                       ; permissions of file / access permissions
  syscall 

  mov [fd], rax                                        ; Helps to write file

  
  call find_le                                         ; Now look line 69 
  mov rdx, rcx 


  mov rax, 1                                           ; sys write
  mov rdi, [fd] 
  mov rsi, msg
  mov rdx, rcx
  syscall 

  mov rax, 3                                           ; sys-close
  mov rdi, [fd] 
  syscall 

  mov rax, 60
  xor rdi, rdi
  syscall 

; It may work without this, but its better to have it here
kill_newline:
  mov rdi, filename                                    ; without it your file will see like 'File.txt'\n'
.loop:
  cmp byte [rdi], 0
  je .done
  cmp byte [rdi], 10
  je .replace
  inc rdi
  jmp .loop
.replace:
  mov byte [rdi], 0
.done:
  ret
 ; without this your text will se like: Hello@@@@...(256 - Hello = 251 other symbol of @) 
find_le:                                              
  mov rdi, msg
  xor rcx, rcx
.loop:
  cmp byte [rdi + rcx], 0
  je .done
  cmp byte [rdi + rcx], 10
  je .done
  inc rcx
  jmp .loop
.done:
  ret
; from line 69 to 94 i cant explain this simply, so its better if you find 
; an explanation from other sourses to avoid confusion
