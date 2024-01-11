#!/bin/bash -l

#SBATCH --ntasks=4
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH --time=1-00:00:00
#SBATCH -p epyc

module load openmpi

which mpicc

mpicc -O2 mpi-hello.c -o mpi-hello

srun ./mpi-hello

