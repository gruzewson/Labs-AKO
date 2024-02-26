; wczytywanie i wyúwietlanie tekstu wielkimi literami
; (inne znaki siÍ nie zmieniajπ)
.686
.model flat
extern _ExitProcess@4 : PROC
extern __write : PROC ; (dwa znaki podkreúlenia)
extern __read : PROC ; (dwa znaki podkreúlenia)
public _main
.data

oryginal	  db 80 dup (0)
zamienione    db 80 dup (0)
liczba_znakow dd ?

latin2_male db 0a5h,86h,0a9h,88h,0e4h,0a2h,98h,0abh,0beh ;πÊÍ≥ÒÛúüø
latin2_duze db 0a4h,8fh,0a8h,9dh,0e3h,0e0h,97h,8dh,0bdh  ;•∆ £—”åèØ

.code

_main PROC
add esp, 12  ; usuniecie parametrÛw ze stosu

; wczytywanie
 push 80
 push OFFSET oryginal
 push 0					; nr urzπdzenia (tu: klawiatura - nr 0)
 call __read 

 add esp, 12

 ; funkcja read wpisuje do rejestru EAX liczbÍ wprowadzonych znakÛw
 mov liczba_znakow, eax
 mov ebx, 0
 mov esi, 0
 ;mov edi, 0

 spacja:
	mov dl, oryginal[ebx]
	inc ebx
	cmp dl, ' '
	je nazwisko
	jmp spacja

 nazwisko:
	mov dl, oryginal[ebx]
	inc ebx
	cmp dl, 0ah
	je poczatekimienia
	mov zamienione[esi], dl
	inc esi
	jmp nazwisko

poczatekimienia:
	mov ebx, 0
	mov zamienione[esi], ' '
	inc esi

imie:
	mov dl, oryginal[ebx]
	inc ebx
	cmp dl, ' '
	je koniec_zamiany
	mov zamienione[esi], dl
	inc esi
	jmp imie

koniec_zamiany:
	mov ebx, 0
	
male:
	cmp ebx, liczba_znakow
	ja wypisz
	mov cl, zamienione[ebx]
	inc ebx
	cmp cl, 'a'
	jb male			; skok, gdy znak nie wymaga zamiany
	cmp cl, 'z'
	ja polskie		; skok, gdy znak nie wymaga zamiany
	sub cl, 20H		; zamiana na wielkie litery
	mov zamienione[ebx - 1], cl
	jmp male

	polskie:
		mov esi, 0
		szukaj_dalej:
		cmp esi, 9
		je male
		inc esi
		cmp cl, latin2_male[esi - 1]
		jne szukaj_dalej
		mov cl, latin2_duze[esi - 1]
		mov zamienione[ebx - 1], cl
		jmp male
	jmp male



wypisz:
	push liczba_znakow
	push OFFSET zamienione
	push 1
	call __write 
	add esp, 12 ; usuniecie parametrÛw ze stosu
	push 0
	call _ExitProcess@4

_main ENDP
END