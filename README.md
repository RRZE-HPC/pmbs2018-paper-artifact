# Artifact Description: Automated Instruction Stream Throughput Prediction for Intel and AMD Microarchitectures
[comment]: <> (keep both copies up-to-date: pmbs2018-paper/artifact-appendix.md and pmbs2018-paper-artifact/README.md)

* Jan Laukemann, Computer Science University of Erlangen-Nürnberg, jan.laukemann@fau.de
* Julian Hammer, RRZE University of Erlangen-Nürnberg, julian.hammer@fau.de, +49 9131 85 20101
* Georg Hager (advisor), RRZE University of Erlangen-Nürnberg, georg.hager@fau.de
* Gerhard Wellein (advisor), RRZE University of Erlangen-Nürnberg, gerhard.wellein@fau.de

## A.1 Abstract
To model in-core performance behavior of throughput bound kernels, accurate prediction of
scheduling and execution of instruction streams is unavoidable. Such in-core models are
indispensable for analytical performance modeling, as done in the Roofline and ECM model, and allow
a deep understanding of the performance-relevant interactions between hardware architecture and
kernel code.

We present a static analysis tool for predicting sequential x86 instruction stream execution time
under the assumption of an infinite first level cache and perfect on out-of-order scheduling. We
show the process of building a model from available documentation and manual benchmarking, carried
out for the latest Intel Skylake and AMD Zen micro-architectures.

To validate the gained model, we apply the methodology to several assembly kernels and compare
runtime predictions with actual measurements on two distinct microarchitectures. In the end we
outline the methodology to extend such models to new architectures.

## A.2 Description

### A.2.1 Check-list (artifact meta information)
- Compilation: gcc
- Binary: x86
- Hardware: Intel skylake, AMD zen
- Publicly available?: yes

### A.2.2 How software can be obtained (if available)
Check out https://github.com/RRZE-HPC/OSACA

### A.2.3 Hardware dependencies
We ran on an AMD EPYC 7451 (Zen architecture) at 1.8 GHz (fixed, turbo disabled) and Intel I7-6700HQ (Skylake SP architecture) at 2.4 GHz (fixed, turbo disabled). The results should be reproducible on any Zen and Skylake SP processors. Fixing the frequency and disabling turbo is vital for experiment reproduction.

### A.2.4 Software dependencies
* Python >= 3.5, with the following packages installed: numpy, pandas, kerncraft
* likwid
* GNU GCC 7.3

On Ubuntu 17.10 install with:
```
apt install gcc-7 python3 python3-pip likwid
pip3 install numpy pandas kerncraft
```

### A.2.5 Datasets
None necessary, everything is part of the code.

## A.3 Installation
Please install OSACA using pip:
```
pip3 install osaca==0.2
```

## A.4 Experiment workflow
To validate our results use the following commands.

Download script and benchmark codes:
```
git clone https://github.com/RRZE-HPC/pmbs2018-paper-artifact
cd pmbs18-paper-appendix/
```
Fix frequencies and disable turbo mode on CPU (for 1.8 GHz, or which ever frequency your CPU will be stable on):
```
likwid-setFrequencies -t 0 -f 1.8
```
Generate predictions (can be gained on any architecture) results with
```
./run_predictions.sh
```
Generate performance (must be done on AMD Zen and Intel Skylake SP machines) results with
```
./run_measurements.sh
```
## A.5 Evaluation and expected result
Fixing the frequency and disabling turbo is very important to verify our results.

### `./run_predictions.sh`

TODO

We expect these numbers to exactly match those in the paper. If your numbers deviate you will mostlikly have used a different compiler. Please compare the generated assembly of your compiler (found in `div/*.s`) with those we have generated for the paper (found in `div/orig/*.s`).

Compare numbers to Table II, IV and V.

### `./run_measurements.sh`
It outputs performance measurements in Time [s], MFlop/s and MLUP/s. MLUP/s can be easily translated to cy/it, as used in the paper: 1 / MLUP/s * Frequency. E.g., 1 / (362.6 MLUP/s) * 1.8 GHz = 4.96 cy/it.

We expect these numbers to lie within 10% of those in the paper, if run on the same micro architectures as mentioned. If your numbers are significantly faster, turbo mode or frequency scaling might be the reson. If they are slower, while running on a laptop or desktop machine, energy saving features may have interfered.

Compare numbers to Table I, III and V.

## A.6 Experiment customization
None

## A.7 Notes
None
