#!/bin/bash -l

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH --time=1-00:00:00

# The latest R is loaded by default
# However, if you want to use a diferent version, then do so here
module load R

# Use Rscript to run R script
Rscript myRscript.R
