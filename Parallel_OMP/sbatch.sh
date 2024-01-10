#!/bin/bash -l

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=1G
#SBATCH --time=1-00:00:00

module load gcc

gcc -fopenmp -O2 -o omp-hello omp-hello.c

export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK}

./omp-hello

