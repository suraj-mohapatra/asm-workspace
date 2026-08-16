section .data
    userMsg db 'please enter a number : ', 0xa
    useMsgLen equ $ - userMsg

    dispMsg db 'number enterted is : '
    dispMsgLen equ $ - dispMsg


section .bss
    num resb 5   ; resb directove, to reserve 5 bytes for the symbol num


section .text:
    global _start                ; declared for linker

_start:
    mov eax,4               ; linux syscall number for sys_write
    mov ebx,1               ; file descriptor stdout
    mov ecx,userMsg
    mov edx,useMsgLen
    int 80h                  ; or 0x80

    mov eax,3             ; linux syscall number for sys_read
    mov ebx,0             ; file descriptor stdin
    mov ecx,num
    mov edx,5
    int 80h                   ; or 0x80


    mov eax,4
    mov ebx,1
    mov ecx,dispMsg
    mov edx,dispMsgLen
    int 80h                     ; or 0x80


    mov eax,4               ; linux syscall number for sys_write
    mov ebx,1               ; file descriptor stdout
    mov ecx,num
    mov edx,5
    int 80h  

    ; this is sys_exit
    mov eax,1          ; 1 is the sys call number for exit
    mov ebx, 0     ; this is optional. the actual argument to sys_exit. so it is called the exit status
    int 0x80