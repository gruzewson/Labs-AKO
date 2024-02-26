.686
.model flat

.data
dwa dd 2.0
trzy dd 3.0
cztery dd 4.0
promien dd ?
x dd ?
obj_kuli dd ?
czesc1 dd ?
czesc2 dd ?
r3 dd ?

.code


_akwarium proc
    push ebp
    mov ebp,esp

    finit
    fld dword ptr [ebp+20];za³adowanie g
    fld dword ptr [ebp+8];za³adowanie D
    fld dword ptr dwa 
    fdivp st(1), st(0) ;st(0) d/2
    fsubp st(2), st(0) ;
    fxch st(1)
    fst dword PTR promien
    finit 

    fld dword ptr promien;za³adowanie promienia

    fmul st(0),st(0)
    fmul st(0),st(0) ;r^3
    fldpi
    fmulp st(1),st(0)
    fld cztery
    fmulp st(1),st(0)
    fld trzy
    fdivp st(1),st(0)

    ;tu sie koñczy kula
    fst obj_kuli

    finit

    fld dword ptr promien;za³adowanie promienia, st(1) obj kuli
    fmul dword PTR trzy ;st(0) ma 3r
    fst r3
    fld dword ptr [ebp + 16];za³adowanie b,
    fld dword ptr [ebp + 20];za³adowanie G, st(1) b
    fsubp st(1), st(0) ;st(0) = x
    fst dword PTR x
    fld dword ptr r3
    fsubrp st(1), st(0) ;3r - x, st(0)
    fld dword ptr x
    fmul st(0), st(0) ;x^2
    fmulp st(1), st(0) 
    fst dword ptr czesc1
    fld dword ptr [ebp + 12] ;a
    fld dword ptr r3
    fsubrp st(1), st(0) ;st(0) = 3r - a
    fld dword ptr [ebp + 12] ;a
    fmul st(0), st(0) ;a^2
    fmulp st(1), st(0)
    fld dword PTR czesc1
    faddp st(1), st(0)
    fst dword PTR czesc2
    fldpi
    fld dword PTR trzy
    fdivp st(1), st(0)
    fld dword PTR czesc2
    fmulp st(1), st(0)
    fld dword PTR obj_kuli
    fsubrp st(1), st(0)


    

    pop ebp
    ret
_akwarium endp
end