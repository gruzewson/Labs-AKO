; MARCEL GRU¯EWSKI 193589
.686
.model flat
public _szukaj_abs_max
.code
_szukaj_abs_max PROC
	push ebp ; zapisanie zawartoœci EBP na stosie
	mov ebp,esp ; kopiowanie zawartoœci ESP do EBP
	push ebx ; przechowanie zawartoœci rejestru EBX
	mov ebx, [ebp+8] ; adres tablicy tabl
	mov ecx, [ebp+12] ; liczba elementów tablicy

	mov eax, [ebx]  ;pierwszy element - w eax jest maximum
	mov edi, eax ;przechowaj wartosc
	neg eax
	jnl nie_przywracaj1
	mov eax, edi ;jesli eax jest ujemne, przywroc wartosc
	nie_przywracaj1:

	dec ecx
	ptl: mov edx, [ebx + 4] ; wpisanie kolejnego elementu tablicy do rejestru EAX

		mov edi, edx ;przechowaj wartosc
		neg edx
		jnl nie_przywracaj2
		mov edx, edi ;jesli edx jest ujemne to przywroc wartosc
		nie_przywracaj2:
		
		; porównanie elementu tablicy wpisanego do EAX z nastêpnym
		cmp eax, edx
		jge gotowe ; skok, gdy eax jest wieksze
		mov eax, edx ;nowe maksimum

	gotowe:
		add ebx, 4 ; wyznaczenie adresu kolejnego elementu
		loop ptl ; organizacja pêtli
		pop ebx ; odtworzenie zawartoœci rejestrów
		pop ebp

		ret ; powrót do programu g³ównego
	
_szukaj_abs_max ENDP
END