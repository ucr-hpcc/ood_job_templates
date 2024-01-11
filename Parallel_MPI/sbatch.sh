#!/bin/bash -l

#SBATCH --nodes=4
#SBATCH --ntasks-per-node=2  # 4 nodes * 2 tasks-per-node = 8 tasks total
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH --time=1-00:00:00
#SBATCH -p epyc

module load openmpi

which mpicc

mpicc -O2 mpi-hello.c -o mpi-hello

srun ./mpi-hello

