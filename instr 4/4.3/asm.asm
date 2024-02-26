.686
.model flat
public _odejmij_jeden
.code
_odejmij_jeden PROC
	push ebp ; zapisanie zawartoœci EBP na stosie
	mov ebp,esp ; kopiowanie zawartoœci ESP do EBP
	push ebx ; przechowanie zawartoœci rejestru EBX
	; wpisanie do rejestru EBX adresu zmiennej zdefiniowanej
	; w kodzie w jêzyku C
	mov ebx, [ebp+8]
	mov ecx, [ebx] ; odczytanie wartoœci zmiennej
	mov eax, [ecx]
	dec eax ; odjecie 1
	mov [ecx], eax ; odes³anie wyniku do zmiennej
	mov ebx, [ecx]
	; uwaga: trzy powy¿sze rozkazy mo¿na zast¹piæ jednym rozkazem
	; w postaci: inc dword PTR [ebx]
	pop ebx
	pop ebp
	ret
_odejmij_jeden ENDP
 END