#!/bin/sh

# TRIAD BENCHMARK
# ===============
cd ./triad/
# Compile
echo 'Building TRIAD benchmarks...'
./build.sh

# Insert IACA marker (kerncraft/iaca_marker must be in $PATH)
echo 'Insert IACA marker...'
printf '1\n' | iaca_marker triad.s.skl.O1.s -o triad.s.skl.O1-iaca.s #.L8
printf '1\n' | iaca_marker triad.s.skl.O2.s -o triad.s.skl.O2-iaca.s #.L7
printf '1\n' | iaca_marker triad.s.skl.O3.s -o triad.s.skl.O3-iaca.s #.L10
printf '1\n' | iaca_marker triad.s.zen.O1.s -o triad.s.zen.O1-iaca.s #.L8
printf '1\n' | iaca_marker triad.s.zen.O2.s -o triad.s.zen.O2-iaca.s #.L7
printf '1\n' | iaca_marker triad.s.zen.O3.s -o triad.s.zen.O3-iaca.s #.L10

# Compile SKL versions for IACA
printf '\nCompile for IACA...\n'
gcc -fopenmp-simd -funsafe-math-optimizations -march=broadwell -O1 -c triad.s.skl.O1-iaca.s
gcc -fopenmp-simd -funsafe-math-optimizations -march=broadwell -O2 -c triad.s.skl.O2-iaca.s
gcc -fopenmp-simd -funsafe-math-optimizations -march=broadwell -O3 -c triad.s.skl.O3-iaca.s

# Compile ZEN versions for IACA
gcc -fopenmp-simd -funsafe-math-optimizations -march=broadwell -O1 -c triad.s.zen.O1-iaca.s
gcc -fopenmp-simd -funsafe-math-optimizations -march=broadwell -O2 -c triad.s.zen.O2-iaca.s
gcc -fopenmp-simd -funsafe-math-optimizations -march=broadwell -O3 -c triad.s.zen.O3-iaca.s

# Create folder for results
mkdir -p results

# Analyze with IACA (put iaca binary in the root directory)
echo 'Run IACA analysis...'
../iaca -arch SKL triad.s.skl.O1-iaca.o > results/iaca.skl.O1.out
../iaca -arch SKL triad.s.skl.O2-iaca.o > results/iaca.skl.O2.out
../iaca -arch SKL triad.s.skl.O3-iaca.o > results/iaca.skl.O3.out

../iaca -arch SKL triad.s.zen.O1-iaca.o > results/iaca.zen.O1.out
../iaca -arch SKL triad.s.zen.O2-iaca.o > results/iaca.zen.O2.out
../iaca -arch SKL triad.s.zen.O3-iaca.o > results/iaca.zen.O3.out

# Analyze with OSACA (osaca must be in $PATH)
echo 'Run OSACA analysis...'
osaca --iaca --arch SKL triad.s.skl.O1-iaca.s > results/osaca.skl.O1.out
osaca --iaca --arch SKL triad.s.skl.O2-iaca.s > results/osaca.skl.O2.out
osaca --iaca --arch SKL triad.s.skl.O3-iaca.s > results/osaca.skl.O3.out
osaca --iaca --arch SKL triad.s.zen.O1-iaca.s > results/osaca.zenOnSkl.O1.out
osaca --iaca --arch SKL triad.s.zen.O2-iaca.s > results/osaca.zenOnSkl.O2.out
osaca --iaca --arch SKL triad.s.zen.O3-iaca.s > results/osaca.zenOnSkl.O3.out

osaca --iaca --arch ZEN triad.s.skl.O1-iaca.s > results/osaca.sklOnZen.O1.out
osaca --iaca --arch ZEN triad.s.skl.O2-iaca.s > results/osaca.sklOnZen.O2.out
osaca --iaca --arch ZEN triad.s.skl.O3-iaca.s > results/osaca.sklOnZen.O3.out
osaca --iaca --arch ZEN triad.s.zen.O1-iaca.s > results/osaca.zen.O1.out
osaca --iaca --arch ZEN triad.s.zen.O2-iaca.s > results/osaca.zen.O2.out
osaca --iaca --arch ZEN triad.s.zen.O3-iaca.s > results/osaca.zen.O3.out

cd ..

# PI BENCHMARK
# =============
cd ./pi/
# Compile
echo 'Building PI benchmarks...'
./build.sh

# Insert IACA marker (kerncraft/iaca_marker must be in $PATH)
echo 'Insert IACA marker...'
printf '0\n' | iaca_marker pi.s.skl.O1.s -o pi.s.skl.O1-iaca.s #.L2
printf '0\n' | iaca_marker pi.s.skl.O2.s -o pi.s.skl.O2-iaca.s #.L2
printf '0\n' | iaca_marker pi.s.skl.O3.s -o pi.s.skl.O3-iaca.s #.L2
printf '0\n' | iaca_marker pi.s.zen.O1.s -o pi.s.zen.O1-iaca.s #.L2
printf '0\n' | iaca_marker pi.s.zen.O2.s -o pi.s.zen.O2-iaca.s #.L2
printf '0\n' | iaca_marker pi.s.zen.O3.s -o pi.s.zen.O3-iaca.s #.L2

# Compile SKL versions for IACA
printf '\nCompile for IACA...\n'
gcc -fopenmp-simd -funsafe-math-optimizations -march=broadwell -O1 -c pi.s.skl.O1-iaca.s
gcc -fopenmp-simd -funsafe-math-optimizations -march=broadwell -O2 -c pi.s.skl.O2-iaca.s
gcc -fopenmp-simd -funsafe-math-optimizations -march=broadwell -O3 -c pi.s.skl.O3-iaca.s

# Create folder for results
mkdir -p results

# Analyze with IACA (put iaca binary in the root directory)
echo 'Run IACA analysis...'
../iaca -arch SKL pi.s.skl.O1-iaca.o > results/iaca.skl.O1.out
../iaca -arch SKL pi.s.skl.O2-iaca.o > results/iaca.skl.O2.out
../iaca -arch SKL pi.s.skl.O3-iaca.o > results/iaca.skl.O3.out

# Analyze with OSACA (osaca must be in $PATH)
echo 'Run OSACA analysis...'
osaca --iaca --arch SKL pi.s.skl.O1-iaca.s > results/osaca.skl.O1.out
osaca --iaca --arch SKL pi.s.skl.O2-iaca.s > results/osaca.skl.O2.out
osaca --iaca --arch SKL pi.s.skl.O3-iaca.s > results/osaca.skl.O3.out

osaca --iaca --arch ZEN pi.s.zen.O1-iaca.s > results/osaca.zen.O1.out
osaca --iaca --arch ZEN pi.s.zen.O2-iaca.s > results/osaca.zen.O2.out
osaca --iaca --arch ZEN pi.s.zen.O3-iaca.s > results/osaca.zen.O3.out

cd ..

echo
echo "Please compare your PI results in pi/results/*.out with orig/pi/*.out"
echo "and Table V of Paper."
echo
echo "Please compare your TRIAD results in triad/results/*.out with orig/traid/*.out"
echo "and Table II and IV, Figure 4, as well as Listings in Section III-A of paper."
