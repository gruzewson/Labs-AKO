.686
.model flat
public _szukaj4_max
.code
_szukaj4_max PROC
	push ebp ; zapisanie zawartoœci EBP na stosie
	mov ebp, esp ; kopiowanie zawartoœci ESP do EBP
	mov eax, [ebp+8] ; liczba x
	cmp eax, [ebp+12] ; porownanie liczb x i y
	jge x_wieksza ; skok, gdy x >= y
	; przypadek x < y
	mov eax, [ebp+12] ; liczba y
	cmp eax, [ebp+16] ; porownanie liczb y i z
	jge y_wieksza_z ; skok, gdy y >= z
	jmp z_wieksze

	wpisz_a: mov eax, [ebp+20] ; liczba a
	zakoncz:
		pop ebp
		ret
	x_wieksza:
		cmp eax, [ebp+16] ; porownanie x i z
		jge x_wieksza_z
		jmp z_wieksze
	y_wieksza_z:
		cmp eax, [ebp+20] ; porownanie y i a
		jge zakoncz ; skok, gdy y >= a
		jmp wpisz_a
	x_wieksza_z:
		cmp eax, [ebp+20] ; porownanie x i a
		jge zakoncz ; skok, gdy x >= a
		jmp wpisz_a
	z_wieksze:
		mov eax, [ebp+16] ; liczba z
		cmp eax, [ebp+20] ; porownanie z i a
		jge zakoncz
		jmp wpisz_a
	
_szukaj4_max ENDP
END