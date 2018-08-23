#!/bin/sh

# TRIAD MEASUREMENTS
# ==================


# DIV MEASUREMENTS
# ================
cd ./div/
# Compile
echo 'Building bechmarks...'
./build.sh

# Run benchmarks
echo 'Run benchmarks'
lscpu | grep 'Model name' | tee measurements.txt
echo '-------------------------' >> measurements.txt
echo 'Compiled for Zen with -O1:' | tee -a measurements.txt
likwid-pin -q -c S0:0 ./a.div.zen.O1 | tee -a measurements.txt
echo 'Compiled for Zen with -O2:' | tee -a measurements.txt
likwid-pin -q -c S0:0 ./a.div.zen.O2 | tee -a measurements.txt
echo 'Compiled for Zen with -O3:' | tee -a measurements.txt
likwid-pin -q -c S0:0 ./a.div.zen.O3 | tee -a measurements.txt

printf '\n\nCompiled for SKL with -O1\n' | tee -a measurements.txt
likwid-pin -q -c S0:0 ./a.div.skl.O1 | tee -a measurements.txt
echo 'Compiled for SKL with -O2' | tee -a measurements.txt
likwid-pin -q -c S0:0 ./a.div.skl.O2 | tee -a measurements.txt
echo 'Compiled for SKL with -O3' | tee -a measurements.txt
likwid-pin -q -c S0:0 ./a.div.skl.O3 | tee -a measurements.txt

mkdir -p results
mv measurements.txt ./results/

cd ..

echo
echo "Please find your results in div/results/measurements.txt"
