#include <stdio.h>
extern __int64 suma_siedmiu_liczb(__int64 v1, __int64 v2, __int64 v3, __int64 v4, __int64 v5, __int64 v6, __int64 v7);

int main()
{
    __int64 a = 0x1, b = 0x1, c = 0x1, d = 0x1, e = 0x1, f = 0x1, g = 0x1;

    __int64 suma = suma_siedmiu_liczb(a, b, c, d, e, f, g);
    printf("\nSuma wynosi %I64d\n", suma);
    return 0;
}