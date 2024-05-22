; subtask 2 - bsearch
section .data
    middle db 0
section .text
    global binary_search
    ;; no extern functions allowed

binary_search:
    ;; create the new stack frame
    enter 0, 0

    ;; save the preserved registers
    ;;ecx - array
    ;;edx - needle
    mov eax, [ebp + 8];; eax = start
    mov esi, [ebp + 12];; esi = end
    cmp eax, esi
    jg .not_found
    ;; recursive bsearch implementation goes here
    mov edi,esi
    add edi,eax
    shr edi,1
    mov dword[middle],edi
    shl edi,2
    add edi,ecx
    cmp dword[edi],edx
    je .found
    jg .left
    jl .right
    ;; restore the preserved registers

    leave
    ret
.left:
    dec dword[middle]
    push dword[middle]
    inc dword[middle]
    push eax
    call binary_search
    add esp, 8
    leave
    ret
.right:
    push esi
    inc dword[middle]
    push dword[middle]
    dec dword[middle]
    call binary_search
    add esp, 8
    leave
    ret
.not_found:
    mov eax, -1
    leave
    ret
.found:
    mov eax, [middle]
    leave
    ret
