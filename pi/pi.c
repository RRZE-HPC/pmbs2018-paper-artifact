#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "timing.h"

int main() {
  double wctstart,wctend,cpustart,cpuend;
  int i,SLICES = 1000000000;

  double  delta_x,x,sum,Pi;


  delta_x = 1./SLICES;
  
  timing(&wctstart,&cpustart);

  sum = 0.;
  for(i=0; i<SLICES; ++i) {
     x = (i+0.5)*delta_x;
     sum = sum + 4.0 / ( 1.0 + x * x);
  }

  Pi = sum * delta_x;

  timing(&wctend,&cpuend);

  double time = wctend-wctstart;
  printf("DIV Benchmark, 6 Flop/it\nTime [s] | MFlop/s | MLUP/s  | Iterations | PI\n");
  printf("%.5lf  | %7.1f | %7.1f | %d |%.15lf \n", time, 6.0*(double)SLICES*1e-6/time, (double)SLICES/time/1000.0/1000.0, SLICES, Pi);

  return 0;
}

