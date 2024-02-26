; MARCEL GRU�EWSKI 193589
.686
.model flat
public _szukaj_abs_max
.code
_szukaj_abs_max PROC
	push ebp ; zapisanie zawarto�ci EBP na stosie
	mov ebp,esp ; kopiowanie zawarto�ci ESP do EBP
	push ebx ; przechowanie zawarto�ci rejestru EBX
	mov ebx, [ebp+8] ; adres tablicy tabl
	mov ecx, [ebp+12] ; liczba element�w tablicy

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
		
		; por�wnanie elementu tablicy wpisanego do EAX z nast�pnym
		cmp eax, edx
		jge gotowe ; skok, gdy eax jest wieksze
		mov eax, edx ;nowe maksimum

	gotowe:
		add ebx, 4 ; wyznaczenie adresu kolejnego elementu
		loop ptl ; organizacja p�tli
		pop ebx ; odtworzenie zawarto�ci rejestr�w
		pop ebp

		ret ; powr�t do programu g��wnego
	
_szukaj_abs_max ENDP
END