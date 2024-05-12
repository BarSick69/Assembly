
section .data
    result dd 0

section .text
    global _start
    extern printf

_start:
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
    mov [result],ecx

    lea ecx,[result]
    mov eax,4
    mov ebx,1
    mov edx,4
    int 0x80
exit:
    mov eax, 1                 ; syscall number (sys_exit)
    xor ebx, ebx               ; exit code
    int 0x80                   ; call kernel
