toupper:
    push ebp
    mov ebp, esp

    ; TODO
    lea eax,[mystring]
    loop:
        mov bl, byte[eax]
        cmp bl,0
        je end
        sub bl,0x20
        mov byte[eax],bl
        inc eax
        jmp loop
    end:
    leave
    ret
