section .data
    num1 equ 5
    num2 equ 7

section .bss
    result resb 3    ; reserving 3 bytes of space fpr result

section .text
    global _start

_start:
    mov eax, num1          ; preaparing eax, eax becomes 5
    add eax, num2          ; pareparing eax, eax becomes 15+7 = 12 as eax is the accumulator
    ; to convert 12 to ASCII
    mov ebx, 10            ; prepaing ebx
    xor edx, edx         ; this makes edx = 0. It's a common and fast way to clear a register
    div ebx              ; eax = 1, edx = 2,  32-bit div so rule says eax is the quotient and edxis the remiander
    ; The CPU has a built-in rule:
    
    add dl, '0'
    mov [result+1], dl

    add al, '0'
    mov [result], al

    mov byte [result+2], 10       ; mov [result+2] did not work

    
    ; write "12"
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 3
    int 0x80

    ; exit
    mov eax, 1
    xor ebx, ebx
    int 0x80