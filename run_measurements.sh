#!/bin/sh

# TRIAD MEASUREMENTS
# ==================
cd ./triad/
# Compile
echo 'Building bechmarks...'
./build.sh

# Run benchmarks
echo 'Run benchmarks'
lscpu | grep 'Model name' | tee measurements.triad.txt
lscpu | grep 'CPU MHz' | tee -a measurements.triad.txt
echo '-------------------------' | tee -a measurements.triad.txt
echo 'Compiled for Zen with -O1:' | tee -a measurements.triad.txt
likwid-pin -q -c S0:0 ./a.triad.zen.O1 | tee -a measurements.triad.txt
echo 'Compiled for Zen with -O2:' | tee -a measurements.triad.txt
likwid-pin -q -c S0:0 ./a.triad.zen.O2 | tee -a measurements.triad.txt
echo 'Compiled for Zen with -O3:' | tee -a measurements.triad.txt
likwid-pin -q -c S0:0 ./a.triad.zen.O3 | tee -a measurements.triad.txt

echo -e '\nCompiled for SKL with -O1' | tee -a measurements.triad.txt
likwid-pin -q -c S0:0 ./a.triad.skl.O1 | tee -a measurements.triad.txt
echo 'Compiled for SKL with -O2' | tee -a measurements.triad.txt
likwid-pin -q -c S0:0 ./a.triad.skl.O2 | tee -a measurements.triad.txt
echo 'Compiled for SKL with -O3' | tee -a measurements.triad.txt
likwid-pin -q -c S0:0 ./a.triad.skl.O3 | tee -a measurements.triad.txt

# Epilogue
sed -i '/likwid-pin/c\' measurements.triad.txt
mkdir -p results
mv measurements.triad.txt ./results/
cd ..


# PI MEASUREMENTS
# ================
cd ./pi/
# Compile
echo 'Building bechmarks...'
./build.sh

# Run benchmarks
echo 'Run benchmarks'
lscpu | grep 'Model name' | tee measurements.pi.txt
lscpu | grep 'CPU MHz' | tee -a measurements.pi.txt
echo '-------------------------' | tee -a measurements.pi.txt
echo 'Compiled for Zen with -O1:' | tee -a measurements.pi.txt
likwid-pin -q -c S0:0 ./a.pi.zen.O1 | tee -a measurements.pi.txt
echo 'Compiled for Zen with -O2:' | tee -a measurements.pi.txt
likwid-pin -q -c S0:0 ./a.pi.zen.O2 | tee -a measurements.pi.txt
echo 'Compiled for Zen with -O3:' | tee -a measurements.pi.txt
likwid-pin -q -c S0:0 ./a.pi.zen.O3 | tee -a measurements.pi.txt

echo -e '\nCompiled for SKL with -O1' | tee -a measurements.pi.txt
likwid-pin -q -c S0:0 ./a.pi.skl.O1 | tee -a measurements.pi.txt
echo 'Compiled for SKL with -O2' | tee -a measurements.pi.txt
likwid-pin -q -c S0:0 ./a.pi.skl.O2 | tee -a measurements.pi.txt
echo 'Compiled for SKL with -O3' | tee -a measurements.pi.txt
likwid-pin -q -c S0:0 ./a.pi.skl.O3 | tee -a measurements.pi.txt

# Epilogue
sed -i '/likwid-pin/c\' measurements.pi.txt
mkdir -p results
mv measurements.pi.txt ./results/
cd ..

echo
echo "Please compare your TRIAD results in triad/results/measurements.triad.txt with orig/measurements.*.triad.txt"
echo "and Table I and III in the paper."
echo
echo "Please compare your PI results in pi/results/measurements.pi.txt with orig/measurements.*.pi.txt"
echo "and Table V in the paper."
