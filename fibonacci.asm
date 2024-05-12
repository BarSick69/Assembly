%include "printf32.asm"

section .text
    global main
    extern printf

main:
    mov eax, 10       ; vrem sa aflam al N-lea numar; N = 7
    mov edx, 0       ; f(0) = 0
    mov ebx, 1       ; f(1) = 1
loop:
    dec eax
    cmp eax, 0
    je end
    mov ecx,edx
    add ecx,ebx
    mov edx,ebx
    mov ebx,ecx
    jmp loop
    ; TODO: calculati al N-lea numar fibonacci (f(0) = 0, f(1) = 1)
end:
    PRINTF32 `Rezultatul este: 0x%hx\n\x0`, ecx
    ret
