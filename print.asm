section .data
    message db "Hello %d", 10, 0

section .text
    global main
    extern printf

main:
    push dword 3
    push dword message
    call printf
    add esp, 8  ; clean up the stack

    mov eax, 1  ; exit syscall
    xor ebx, ebx  ; return 0 status
    int 0x80  ; invoke syscall
