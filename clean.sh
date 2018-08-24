#!/bin/sh

# Remove all TRIAD builds and results
cd ./triad/
rm -rf a.triad.* triad.s.* triad.o timing.o results/
cd ..

# Remove all PI builds and results
cd ./pi/
rm -rf a.pi.* pi.s.* pi.o timing.o results/
cd ..
