section .text
    global _start   ; declared for linker

_start:             ; tells linker that this is the entry point
    MOV EAX, 4      ; assign the system linux kernel sys call number for (sys_write)
    MOV EBX, 1      ; this is file descriptor (1st argument of the sys call)
    MOV ECX,msg     ; buffer, message to write, address of the first byte of msg (2nd argument)
    MOV EDX,len     ; length of message, number of bytes to write (3rd argument)
    int 0x80        ; invoke the Linux kernel to execute the system call

    MOV EAX,1       ; system call number 1, used for exiting the program
    int 0x80        ; call kernel to exit



section .data
msg db 'hello world!', 0xA     ;  string to be printed
len equ $-msg                 ; length of the string