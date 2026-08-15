section .data
    msg db 'displaying 9 characters : ', 0xa     ; string to be printed
    len equ $-msg                             ; length of the string
    s2 times 9 db '*'                         ; times is a directive
        db 0xa                                ; for a line feed at the end


section .text
    global _start   ; declared for linker

_start:             ; tells linker that this is the entry point
    MOV EAX, 4      ; assign the system linux kernel sys call number for (sys_write)
    MOV EBX, 1      ; this is file descriptor (1st argument of the sys call)
    MOV ECX,msg     ; buffer, message to write, address of the first byte of msg (2nd argument)
    MOV EDX,len     ; length of message, number of bytes to write (3rd argument)
    int 80h         ; invoke the Linux kernel to execute the system call

    MOV EAX,4
    MOV EBX, 1
    MOV ECX,s2
    MOV EDX,10      ; directly hardcoded the length of s2 that includes 9 *s aand the line feed
    int 0x80

    MOV EAX,1       ; system call number 1, used for exiting the program
    int 80h         ; call kernel to exit, also can write 0x80