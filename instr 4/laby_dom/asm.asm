.686
.model flat
public _suma
.code
    _suma PROC
        push ebp
        mov ebp,esp; przechowanie rejestr�w
        push ebx
        
        mov ecx, [ebp+8];liczba element�w tablic
        mov ebx, [ebp+12];wczytanie adresu tablicy
        dec ecx
        mov eax, [ebx]
        ptl:
            add ebx, 4
            add eax, [ebx]
            loop ptl

        pop ebx
        pop ebp
        ret
    _suma ENDP
END