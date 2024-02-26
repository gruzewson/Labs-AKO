.686
.model flat
.data
.code
_nowy_exp PROC
    push ebp
    mov ebp,esp
    mov eax,[esp+8];wczytanie x
    mov ecx, 19
    finit
    
    push eax
    fld dword ptr [esp];wczytanie x do koprocesora (st(6))
    add esp, 4

    fld1;wczytanie wolnej jedynki

    fld1;wczytanie silni

    push eax
    fld dword ptr [esp];wczytanie x do koprocesora st(3)
    add esp, 4

    fld1;wczytanie wyniku =1 do koprocesora

    fld1;wczytanie licznika

    fld1; wczytanie wolnego rejestru do obliczeñ (temp)

    ;st(0) -> rejestr do obliczeñ
    ;st(1) -> kolejna liczba do silni (n)
    ;st(2) -> wynik
    ;st(3) -> x^n
    ;st(4) -> silnia
    ;st(5) -> jedynka do dodawania do silni
    ;st(6) -> x
    sumuj:
        ;obliczenie x^n/n!
        fxch st(3);wrzucenie x^n do st(0)
        fst st(3);skopiowanie x^n do st(3)
        fdiv st(0),st(4);x^n/n!
        fadd st(2),st(0);wynik + x^n/n!

        ;n++
        fxch st(1); n do st(0)
        fadd st(0), st(5);zwiêkszenie licznika
        fst st(1); zwiêkszony n do st(1)

        ;zwiêkszanie silni
        fxch st(4);pobranie silni do st(0)
        fmul st(0),st(1);powiêkszenie silni
        fst st(4);odajemy ³adnie silnie do st(4)

        ;x^n
        fxch st(3);zamiana miejscami x i st(0)
        fmul st(0),st(6);podniesienie x do kolejnej potêgi
        fxch st(3);powrót x do st(2)

    loop sumuj

    fxch st(2);wyrzucenie wyniku do st(0)

    pop ebp
    ret
 _nowy_exp ENDP
 END