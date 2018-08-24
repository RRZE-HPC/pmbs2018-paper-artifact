#!/bin/sh

# Compile timing.c
gcc -O3 -march=native -c timing.c

# Compile for SKL
gcc -fopenmp-simd -funsafe-math-optimizations -march=broadwell -O1 -c pi.c
gcc -fopenmp-simd -funsafe-math-optimizations -march=broadwell -O1 -S pi.c -o pi.s.skl.O1.s
gcc pi.o timing.o -lm -o a.pi.skl.O1
gcc -fopenmp-simd -funsafe-math-optimizations -march=broadwell -O2 -c pi.c 
gcc -fopenmp-simd -funsafe-math-optimizations -march=broadwell -O2 -S pi.c -o pi.s.skl.O2.s
 gcc pi.o timing.o -lm -o a.pi.skl.O2          
gcc -fopenmp-simd -funsafe-math-optimizations -march=broadwell -O3 -c pi.c
gcc -fopenmp-simd -funsafe-math-optimizations -march=broadwell -O3 -S pi.c -o pi.s.skl.O3.s
gcc pi.o timing.o -lm -o a.pi.skl.O3

# Compile for Zen
gcc -fopenmp-simd -funsafe-math-optimizations -march=znver1 -mavx2 -mfma -O1 -c pi.c
gcc -fopenmp-simd -funsafe-math-optimizations -march=znver1 -mavx2 -mfma -O1 -S pi.c -o pi.s.zen.O1.s
gcc pi.o timing.o -lm -o a.pi.zen.O1
gcc -fopenmp-simd -funsafe-math-optimizations -march=znver1 -mavx2 -mfma -O2 -c pi.c
gcc -fopenmp-simd -funsafe-math-optimizations -march=znver1 -mavx2 -mfma -O2 -S pi.c -o pi.s.zen.O2.s
gcc pi.o timing.o -lm -o a.pi.zen.O2
gcc -fopenmp-simd -funsafe-math-optimizations -march=znver1 -mavx2 -mfma -O3 -c pi.c
gcc -fopenmp-simd -funsafe-math-optimizations -march=znver1 -mavx2 -mfma -O3 -S pi.c -o pi.s.zen.O3.s
gcc pi.o timing.o -lm -o a.pi.zen.O3
