extern float compute(float a, float b, float* wynik);
#include <stdio.h>
int main()
{
    float a = 1.0 + pow(2.0, -23);
    float b = 10.75f;
    float wynik = 0.0f;
    printf_s("%.15lf", compute(a,b,&wynik));
}