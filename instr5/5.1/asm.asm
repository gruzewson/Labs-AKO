.686
.model flat
public    _compute
.data
    dwa dd 2.0
    trzy dd 3.0
.code
_compute PROC
    push ebp
    mov ebp, esp

    mov eax, [ebp+8]
    mov ebx, [ebp+12]
    mov edi, [ebp+16]

    and eax, 7FFFFFH
    shl eax, 23
    add ebx, eax

    mov [edi], ebx

    pop ebp
    ret
 _compute ENDP
 END

