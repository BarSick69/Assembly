; subtask 1 - qsort
section .data
    pivot dd 0
    i dd 0
    j dd 0
    temp dd 0
section .text
    global quick_sort
    ;; no extern functions allowed

quick_sort:
    ;; create the new stack frame

    ;; save the preserved registers
    push ebp
    mov ebp, esp

    mov edx, [ebp + 8];;array
    mov ecx, [ebp + 12];;start
    mov eax, [ebp + 16];;end
    ;; recursive qsort implementation goes here
    cmp ecx, eax
    jge .end;;base case
    ;;int pivot=array[end]
    push eax
    shl eax,2
    add eax,edx
    mov eax,dword[eax]
    mov dword[pivot],eax;;pivot is the last element
    pop eax
    ;;int i=start-1
    dec ecx
    mov [i],ecx
    inc ecx
    ;;for(int j=start;j<end-1;j++)
    mov [j],ecx;;j=start
.loop1:
    ;;check if j<=end-1
    dec eax
    cmp [j],eax
    jg .endloop1
    inc eax
    
    push esi
    push eax
    mov eax,[j]
    shl eax,2
    add eax,edx
    mov esi,dword[eax];;esi=array[j]
    pop eax
    ;;if(array[j]<=pivot)
    cmp esi,[pivot]
    jl .swap
    pop esi   
    inc dword[j]
    jmp .loop1
    .endloop1:
    inc dword[i]
    push esi
    push eax
    mov eax,[j]
    shl eax,2
    add eax,edx
    mov esi,dword[eax];;esi=array[j]
    mov eax,[i]
    shl eax,2
    add eax,edx
    push esi
    mov esi,temp
    mov eax,dword[eax];;temp=array[i]
    mov [esi],eax;;temp=array[i]
    pop esi
    mov eax,[i]
    shl eax,2
    add eax,edx
    mov dword[eax],esi;;array[i]=array[j]
    mov eax,[j]
    shl eax,2
    add eax,edx
    push esi
    mov esi,[temp]
    mov dword[eax],esi;;array[j]=temp
    pop esi
    pop eax
    pop esi
    leave
    ret

.swap:
    inc dword[i]
    push eax
    mov eax,dword[i]
    shl eax,2
    add eax,edx
    mov eax,dword[eax]
    mov [temp],eax;;temp=array[i]
    mov eax,[i]
    shl eax,2
    add eax,edx
    mov dword[eax],esi;;array[i]=array[j]
    mov eax,dword[j]
    shl eax,2
    add eax,edx
    push esi
    mov esi,[temp]
    mov dword[eax],esi;;array[j]=temp
    pop esi
    pop eax
    inc dword[j]
    pop esi
    jmp .loop1
.end:
    ;; restore the preserved registers
    leave
    ret
