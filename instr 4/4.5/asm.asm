public suma_siedmiu_liczb
.code
suma_siedmiu_liczb PROC
	push rbp
	mov rbp,rsp; przechowanie rejestrów
	push rbx
	push rsi

	mov rax,0; w rax bedzie suma
	mov rsi,0; rsi to indeks parametrów ze stosu

	add rax,rcx
    add rax, rdx
    add rax, r8
	add rax, r9

	ptl:
		mov rbx, [rbp+rsi*8 + 48];pobierz zmienna
		add rax, rbx;dodaj zmienna
		inc rsi;zwiek indeks
		cmp rsi, 3;sprawdz czy nie pora konczyc
		je koniec
		jmp ptl

	koniec:
		pop rsi
		pop rbx
		pop rbp
		ret
suma_siedmiu_liczb ENDP
END