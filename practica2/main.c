#include <stdio.h>
#include <stdlib.h>

void get_symbol(float n) {
  printf("%d", (unsigned int)n >> 31 & 1);
  printf("\n");
}

void get_exponent(float n){
  float *p = &n;
  int m = (int) p;
  for(int i = 7; i >= 0; i--)
    printf("%d", m >> 23+i & 1);
  printf("\n");
}


void get_mantissa(float n){
  float *p = &n;
  int m = (int) p;
  for(int i = 22; i >= 0; i--)
    printf("%d", m >> i & 1);
  printf("\n");
}

int main() {
  float f = 0.136;
  get_symbol(f);
  get_exponent(f);
  get_mantissa(f);

  return 0;
}