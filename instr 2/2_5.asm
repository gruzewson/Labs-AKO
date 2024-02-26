; wczytywanie i wy�wietlanie tekstu wielkimi literami
; (inne znaki si� nie zmieniaj�)
.686
.model flat
extern _ExitProcess@4 : PROC
extern _MessageBoxA@16 : PROC
extern _MessageBoxW@16 : PROC
extern __write : PROC ; (dwa znaki podkre�lenia)
extern __read : PROC ; (dwa znaki podkre�lenia)
public _main
.data
tekst_pocz    db 10, 'Prosz� napisa� jaki� tekst '
		      db 'i nacisnac Enter', 10

koniec_t      db ?
magazyn       db 80 dup (?)
magazyn_utf16 dw 180 dup (?)
nowa_linia	  db 10
liczba_znakow dd ?

tytul		  db 'zadanie 2.6', 0
tytul2		  db 'z', 0

pl_znaki_latin2		db 0A5H, 0A4H, 86H, 8FH, 0A9H, 0A8H, 88H, 9DH, 0E4H, 0E3H ; �����ʳ���
					db 0A2H, 0E0H, 98H, 97H, 0ABH, 8DH, 0BEH, 0BDH ; �Ӝ�����
pl_znaki_win1250	db 0A5H, 0A5H, 0C6H, 0C6H, 0CAH, 0CAH, 0A3H, 0A3H, 0D1H, 0D1H ; �����ʳ���
					db 0D3H, 0D3H, 8CH, 8CH, 8FH, 8FH, 0AFH, 0AFH ; �Ӝ�����

pl_znaki_UTF16      dw 0105H, 0104H, 0107H, 0106H, 0119H, 0118H, 0142H, 0141H, 0144H, 0143H ; �����ʳ���
					dw 00F3H, 00D3H, 015BH, 015AH, 017AH, 0179H, 017CH, 017BH ; �Ӝ�����


.code
_main PROC
tekst_Win1250 dw 'w', 0
; wy�wietlenie tekstu informacyjnego
; liczba znak�w tekstu
 mov ecx,(OFFSET koniec_t) - (OFFSET tekst_pocz)
 push ecx
 push OFFSET tekst_pocz										; adres tekstu
 push 1														; nr urz�dzenia (tu: ekran - nr 1)
 call __write												; wy�wietlenie tekstu pocz�tkowego
 add esp, 12												; usuniecie parametr�w ze stosu


; czytanie wiersza z klawiatury
 push 80													; maksymalna liczba znak�w
 push OFFSET magazyn
 push 0														; nr urz�dzenia (tu: klawiatura - nr 0)
 call __read												; czytanie znak�w z klawiatury
 add esp, 12												; usuniecie parametr�w ze stosu

; kody ASCII napisanego tekstu zosta�y wprowadzone
; do obszaru 'magazyn'
; funkcja read wpisuje do rejestru EAX liczb�
; wprowadzonych znak�w
 mov liczba_znakow, eax
; rejestr ECX pe�ni rol� licznika obieg�w p�tli
 mov ecx, eax
 mov ebx, 0		; indeks pocz�tkowy
ptl: 
	mov dl, magazyn[ebx]									; pobranie kolejnego znaku

 cmp dl, 'a'
 jb dalej											; skok, gdy znak nie wymaga zamiany

 ;polskie litery
 mov ebp, 0
 ptl2: 
	cmp dl, pl_znaki_latin2[ebp]
	jne jezeli_nie
	mov dl,pl_znaki_win1250[ebp] 
;	mov dl,pl_znaki_utf16[ebp]
	je dalej

jezeli_nie:
	inc ebp
	cmp ebp, 18 ;czy juz cala tablica
	jb ptl2

 cmp dl, 'z'
 ja dalej
 sub dl, 20H										; zamiana na wielkie litery										; odes�anie znaku do pami�ci


; odes�anie znaku do pami�ci
dalej: 
 mov magazyn[ebx], dl
 inc ebx						; inkrementacja indeksu
;dec ecx
 dec ecx
 jnz ptl						; sterowanie p�tl�

; wy�wietlenie przekszta�conego tekstu
 ;push liczba_znakow
 ;push OFFSET magazyn
 ;push 1
 ;call __write ; wy�wietlenie przekszta�conego tekstu
; adres obszaru zawieraj�cego tytu�
; push OFFSET tytul_Win1250
; adres obszaru zawieraj�cego tekst
 push 0
 push OFFSET tytul
 push OFFSET magazyn
 push 0 ; NULL
 call _MessageBoxA@16

 push 0; MB_OK
 push OFFSET tytul2; tytul okna
 push OFFSET magazyn_utf16; wrzucenie przerobionego tekstu 
 push 0;
 call _MessageBoxW@16 ; Wywolanie funckji 

; push 0 ; stala MB_OK
 add esp, 12 ; usuniecie parametr�w ze stosu
 call _ExitProcess@4 ; zako�czenie programu
_main ENDP
END
