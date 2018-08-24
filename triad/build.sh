#!/bin/sh

# Compile timing.c
gcc -O3 -march=broadwell -c timing.c

# Compile for SKL
gcc -fopenmp-simd -march=broadwell -O1 -c triad.c
gcc -fopenmp-simd -march=broadwell -O1 -S triad.c -o triad.s.skl.O1.s
gcc triad.o timing.o -lm -o a.triad.skl.O1
gcc -fopenmp-simd -march=broadwell -O2 -c triad.c
gcc -fopenmp-simd -march=broadwell -O2 -S triad.c -o triad.s.skl.O2.s
gcc triad.o timing.o -lm -o a.triad.skl.O2
gcc -fopenmp-simd -march=broadwell -O3 -c triad.c
gcc -fopenmp-simd -march=broadwell -O3 -S triad.c -o triad.s.skl.O3.s
gcc triad.o timing.o -lm -o a.triad.skl.O3

# Compile for Zen
gcc -fopenmp-simd -march=znver1 -mavx2 -mfma -O1 -c triad.c
gcc -fopenmp-simd -march=znver1 -mavx2 -mfma -O1 -S triad.c -o triad.s.zen.O1.s
gcc triad.o timing.o -lm -o a.triad.zen.O1
gcc -fopenmp-simd -march=znver1 -mavx2 -mfma -O2 -c triad.c
gcc -fopenmp-simd -march=znver1 -mavx2 -mfma -O2 -S triad.c -o triad.s.zen.O2.s
gcc triad.o timing.o -lm -o a.triad.zen.O2
gcc -fopenmp-simd -march=znver1 -mavx2 -mfma -O3 -c triad.c
gcc -fopenmp-simd -march=znver1 -mavx2 -mfma -O3 -S triad.c -o triad.s.zen.O3.s
gcc triad.o timing.o -lm -o a.triad.zen.O3
