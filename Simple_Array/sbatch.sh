#!/bin/bash -l

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH --time=1-00:00:00
#SBATCH --array=1-10

ARRAY_ID=${SLURM_ARRAY_TASK_ID}

echo "Processing Task ${SLURM_ARRAY_TASK_ID}"

python my_program.py ${SLURM_ARRAY_TASK_ID}

