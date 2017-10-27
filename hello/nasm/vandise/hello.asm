%define BUFFER_SIZE 256

section .bss

  buffer resb BUFFER_SIZE

section .data

  prompt:        db "What is your name? "
  prompt_size:   equ $-prompt

  greeting:      db "Hello "
  greeting_size: equ $-greeting

  punctuation:   db "!"

section .text

  global start

start:
  nop

Input:  mov  rax,   0x2000004		;sys_wite
        mov  rdi,   1
        mov  rsi,   prompt
        mov  rdx,   prompt_size	
        syscall

Read:   mov rax,  0x2000003     ; sys_read
        mov rdi,  0
        mov rsi,  buffer
        mov rdx,  BUFFER_SIZE
        syscall

        dec  al                 ; remove newline char

        lea rdx, [rel buffer]
        mov rdi, [rel punctuation]
        mov [rdx + rax], rdi    ; set punctuation to newline position

        inc rax                 ; account for punctuation
        push rax                ; push value to stack for message write

Write:  mov rax,  0x2000004     ;sys_wite "Hello "
        mov rdi,  1
        mov rsi,  greeting
        mov rdx,  greeting_size
        syscall

        mov rax,  0x2000004     ;sys_wite <user input>
        mov rdi,  1
        mov rsi,  buffer
        pop rdx                 ; pop input size from stack to rdx
        syscall

Exit:   mov rax,  0x2000001     ; sys_exit
        mov rdi,  0             ; status code - 0
        syscall
