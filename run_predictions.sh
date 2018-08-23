#!/bin/sh

# TRIAD BENCHMARK
# ===============

# DIV BENCHMARK
# =============

cd ./div/
# Compile
echo 'Building benchmarks...'
./build.sh

# Insert IACA marker (kerncraft/iaca_marker must be in $PATH)
echo 'Insert IACA marker...'
echo '0\n' | iaca_marker div.s.skl.O1.s -o div.s.skl.O1-iaca.s #.L2
echo '0\n' | iaca_marker div.s.skl.O2.s -o div.s.skl.O2-iaca.s #.L2
echo '0\n' | iaca_marker div.s.skl.O3.s -o div.s.skl.O3-iaca.s #.L2
echo '0\n' | iaca_marker div.s.zen.O1.s -o div.s.zen.O1-iaca.s #.L2
echo '0\n' | iaca_marker div.s.zen.O2.s -o div.s.zen.O2-iaca.s #.L2
echo '0\n' | iaca_marker div.s.zen.O3.s -o div.s.zen.O3-iaca.s #.L2

# Compile SKL versions for IACA
echo 'Compile for IACA...'
gcc -fopenmp-simd -funsafe-math-optimizations -march=broadwell -O1 -c div.s.skl.O1-iaca.s
gcc -fopenmp-simd -funsafe-math-optimizations -march=broadwell -O2 -c div.s.skl.O2-iaca.s
gcc -fopenmp-simd -funsafe-math-optimizations -march=broadwell -O3 -c div.s.skl.O3-iaca.s

# Create folder for results
mkdir -p results

# Analyze with IACA (put iaca binary in the root directory)
echo 'Run IACA analysis...'
../iaca -arch SKL div.s.skl.O1-iaca.o > results/iaca.skl.O1.out
../iaca -arch SKL div.s.skl.O2-iaca.o > results/iaca.skl.O2.out
../iaca -arch SKL div.s.skl.O3-iaca.o > results/iaca.skl.O3.out

# Analyze with OSACA (osaca must be in $PATH)
echo 'Run OSACA analysis...'
osaca --iaca --arch SKL div.s.skl.O1-iaca.s > results/osaca.skl.O1.out
osaca --iaca --arch SKL div.s.skl.O2-iaca.s > results/osaca.skl.O2.out
osaca --iaca --arch SKL div.s.skl.O3-iaca.s > results/osaca.skl.O3.out

osaca --iaca --arch ZEN div.s.zen.O1-iaca.s > results/osaca.zen.O1.out
osaca --iaca --arch ZEN div.s.zen.O2-iaca.s > results/osaca.zen.O2.out
osaca --iaca --arch ZEN div.s.zen.O3-iaca.s > results/osaca.zen.O3.out

cd ..
