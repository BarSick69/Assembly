section .data
    NUMBERS db 89,76,67,56,45,34  ; Declare an array of bytes
    size db 6                      ; Declare the size of the array
section .text
    global _start                  ; Declare the entry point for the program

_start:
mov cl,-1                         ; Initialize outer loop counter
mov ch,[size]                     ; Load the size of the array into ch
dec ch                            ; Decrement ch to get the last index of the array

outer_loop:
inc cl                            ; Increment outer loop counter
mov bl,0                          ; Initialize inner loop counter
cmp cl,ch                         ; Compare outer loop counter with the last index
je show                           ; If they're equal, jump to show

inner_loop:
mov al,ch                         ; Load the last index into al
sub al,cl                         ; Subtract the outer loop counter from al
cmp bl,al                         ; Compare the inner loop counter with the result
jge outer_loop                    ; If bl >= al, jump to outer_loop
lea edx,[NUMBERS]                 ; Load the address of NUMBERS into edx
add edx,ebx                       ; Add the inner loop counter to edx to get the address of the current element
mov al, [edx]                     ; Load the current element into al
mov ah, [edx+1]                   ; Load the next element into ah
cmp al,ah                         ; Compare the two elements
jg swap                           ; If al > ah, jump to swap
inc bl                            ; Increment the inner loop counter
jmp inner_loop                    ; Jump back to the start of the inner loop

swap:
mov [edx],ah                      ; Swap the two elements
mov [edx+1],al
inc bl                            ; Increment the inner loop counter
jmp inner_loop                    ; Jump back to the start of the inner loop

show:
mov ah,[NUMBERS]                  ; Load the sorted array into ah
mov ah,[NUMBERS + 1]
mov ah,[NUMBERS + 2]
mov ah,[NUMBERS + 3]
mov ah,[NUMBERS + 4]
mov ah,[NUMBERS + 5]

exit:
mov eax, 1                        ; syscall number (sys_exit)
xor ebx, ebx                      ; exit code
int 0x80                          ; call kernel
