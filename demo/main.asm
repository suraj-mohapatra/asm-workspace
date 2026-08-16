global _start
extern add_numbers

section .bss
    buffer resb 10

section .text

_start:
    mov eax, 10
    mov ebx, 20

    call add_numbers        ; EAX = 30

    ; Convert EAX to ASCII
    mov ebx, 10
    mov ecx, buffer + 10

convert:
    xor edx, edx
    div ebx                 ; EAX / 10
                            ; EDX = remainder

    add dl, '0'             ; convert digit to ASCII
    dec ecx
    mov [ecx], dl

    test eax, eax
    jnz convert

    ; sys_write
    mov eax, 4              ; sys_write
    mov ebx, 1              ; stdout
    mov edx, buffer + 10
    sub edx, ecx            ; length
    int 0x80

    ; exit
    mov eax, 1              ; sys_exit
    xor ebx, ebx
    int 0x80





    ;nasm -f elf32 main.asm -o main.o
    ;nasm -f elf32 math.asm -o math.o
    ;ld -m elf_i386 main.o math.o -o program
    ;./program