.686
.model flat
public _odejmij_jeden
.code
_odejmij_jeden PROC
	push ebp ; zapisanie zawarto�ci EBP na stosie
	mov ebp,esp ; kopiowanie zawarto�ci ESP do EBP
	push ebx ; przechowanie zawarto�ci rejestru EBX
	; wpisanie do rejestru EBX adresu zmiennej zdefiniowanej
	; w kodzie w j�zyku C
	mov ebx, [ebp+8]
	mov ecx, [ebx] ; odczytanie warto�ci zmiennej
	mov eax, [ecx]
	dec eax ; odjecie 1
	mov [ecx], eax ; odes�anie wyniku do zmiennej
	mov ebx, [ecx]
	; uwaga: trzy powy�sze rozkazy mo�na zast�pi� jednym rozkazem
	; w postaci: inc dword PTR [ebx]
	pop ebx
	pop ebp
	ret
_odejmij_jeden ENDP
 END