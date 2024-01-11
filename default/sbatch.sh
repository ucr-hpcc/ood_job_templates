#!/bin/bash

#SBATCH -p short           # Which partition to use. Options are: short, epyc, intel, batch, highmem, gpu
#SBATCH -t 2:00:00         # Time for the job to run
#SBATCH --cpus-per-task 1  # Number of cores to request, per task
#SBATCH --mem 1G           # Amount of memory to request
#SBATCH --nodes=1          # Number of nodes to use for MPI Jobs
#SBATCH --ntasks=1         # Number of tasks to use for MPI Jobs
#SBATCH --mail-user=useremail@address.com
#SBATCH --mail-type=ALL
#SBATCH --job-name="my test job"

date

MACHINE=$(hostname)

echo "Hello World! I am running on ${MACHINE}"

