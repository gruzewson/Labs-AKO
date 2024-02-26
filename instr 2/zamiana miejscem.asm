; wczytywanie i wy�wietlanie tekstu wielkimi literami
; (inne znaki si� nie zmieniaj�)
.686
.model flat
extern _ExitProcess@4 : PROC
extern __write : PROC ; (dwa znaki podkre�lenia)
extern __read : PROC ; (dwa znaki podkre�lenia)
public _main
.data

oryginal   db 80 dup (0)
zamienione db 80 dup (0)
liczba_znakow dd ?

.code

_main PROC
add esp, 12  ; usuniecie parametr�w ze stosu

; wczytywanie
 push 80
 push OFFSET oryginal
 push 0					; nr urz�dzenia (tu: klawiatura - nr 0)
 call __read 

 add esp, 12

 ; funkcja read wpisuje do rejestru EAX liczb� wprowadzonych znak�w
 mov liczba_znakow, eax
 mov ecx, eax
 mov ebx, 0
 mov esi, 0

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
	je wypisz
	mov zamienione[esi], dl
	inc esi
	jmp imie

wypisz:
	push liczba_znakow
	push OFFSET zamienione
	push 1
	call __write 
	add esp, 12 ; usuniecie parametr�w ze stosu
	push 0
	call _ExitProcess@4

_main ENDP
END
