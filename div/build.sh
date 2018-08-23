#!/bin/sh

# Compile timing.c
gcc -O3 -march=native -c timing.c

# Compile for SKL
gcc -fopenmp-simd -funsafe-math-optimizations -march=broadwell -O1 -c div.c
gcc -fopenmp-simd -funsafe-math-optimizations -march=broadwell -O1 -S div.c -o div.s.skl.O1.s
gcc div.o timing.o -lm -o a.div.skl.O1
gcc -fopenmp-simd -funsafe-math-optimizations -march=broadwell -O2 -c div.c 
gcc -fopenmp-simd -funsafe-math-optimizations -march=broadwell -O2 -S div.c -o div.s.skl.O2.s
 gcc div.o timing.o -lm -o a.div.skl.O2          
gcc -fopenmp-simd -funsafe-math-optimizations -march=broadwell -O3 -c div.c
gcc -fopenmp-simd -funsafe-math-optimizations -march=broadwell -O3 -S div.c -o div.s.skl.O3.s
gcc div.o timing.o -lm -o a.div.skl.O3

# Compile for Zen
gcc -fopenmp-simd -funsafe-math-optimizations -march=znver1 -mavx2 -mfma -O1 -c div.c
gcc -fopenmp-simd -funsafe-math-optimizations -march=znver1 -mavx2 -mfma -O1 -S div.c -o div.s.zen.O1.s
gcc div.o timing.o -lm -o a.div.zen.O1
gcc -fopenmp-simd -funsafe-math-optimizations -march=znver1 -mavx2 -mfma -O2 -c div.c
gcc -fopenmp-simd -funsafe-math-optimizations -march=znver1 -mavx2 -mfma -O2 -S div.c -o div.s.zen.O2.s
gcc div.o timing.o -lm -o a.div.zen.O2
gcc -fopenmp-simd -funsafe-math-optimizations -march=znver1 -mavx2 -mfma -O3 -c div.c
gcc -fopenmp-simd -funsafe-math-optimizations -march=znver1 -mavx2 -mfma -O3 -S div.c -o div.s.zen.O3.s
gcc div.o timing.o -lm -o a.div.zen.O3
