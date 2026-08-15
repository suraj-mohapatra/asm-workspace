section .text
    global _start

_start:
    MOV RAX, 1          ; system call number 1 = sys_write
    MOV RDI, 1          ; 1st argument = file descriptor (stdout)
    MOV RSI, msg        ; 2nd argument = address of the message
    MOV RDX, len        ; 3rd argument = length of the message
    syscall             ; invoke the Linux kernel

    MOV RAX, 60         ; system call number 60 = sys_exit
    MOV RDI, 0          ; 1st argument = exit status (0 = success)
    syscall             ; invoke the Linux kernel


section .data
msg db 'hello world!', 0xA    ; string to be printed
len equ $-msg                 ; length of the string