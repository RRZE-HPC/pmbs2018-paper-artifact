#include <stdio.h>
#include "timing.h"
#include <stdlib.h>
#include <math.h>

void dummy(double*);

void triad(int size) {
  double *a, *b, *c, *d;
  a = aligned_alloc(64, size*sizeof(double));
  b = aligned_alloc(64, size*sizeof(double));
  c = aligned_alloc(64, size*sizeof(double));
  d = aligned_alloc(64, size*sizeof(double));
  for(int i=0; i<size; ++i)
    a[i] = b[i] = c[i] = d[i] = 0.000000123123123123;

  double wcs, wce, ct, runtime;
  int repeat = 1;
  for(runtime=0.0; runtime < .2; repeat *= 2) {
    timing(&wcs, &ct);
    for(int i=0; i<repeat; ++i) {
      if(a[0] > 0) dummy(a);

      #pragma vector aligned
      //#pragma omp simd // enabled O3-like optimizations with O1
      for(int j=0; j<size; ++j)
        a[j] = b[j] + c[j]*d[j];
    } 
    timing(&wce, &ct);
    runtime = wce-wcs;
  }
  repeat /= 2;
  printf("%12.1f | %9.8f | %9.3f | %7.1f | %7.1f | %7d | %4d \n", (double)size*sizeof(double)/1000.0, runtime, 2.0*(double)size*(double)repeat*1e-6/runtime, 32.0*(double)repeat*(double)size/runtime/1024.0/1024.0, (double)repeat*(double)size/runtime/1000.0/1000.0, repeat, size);
  
  free(a); free(b); free(c); free(d);
}

int main(int argc, char *argv[]) 
{
  printf("TRIAD a[i] = b[i]+c[i]*d[i], 32 byte/it, 2 Flop/it\n");
  printf("Size (KByte) |   runtime  |  MFlop/s  |  MB/s   |  MLUP/s | repeat | size\n");
  for(int i=20; i<=35; ++i) {
    triad((int)pow(1.3, i));
  }
  return 0;
}
