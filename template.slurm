#!/bin/bash

# some options, not necessarily used together 

#SBATCH --account=zero
#SBATCH --partition=zero
#SBATCH --job-name=zero
#SBATCH --nodes=1   
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1 
#SBATCH --mem-per-cpu=1G  
#SBATCH --mem=1G
#SBATCH --cpus-per-gpu=1
#SBATCH --gres=gpu:h900:1             
#SBATCH --time=00-00:01:00 
#SBATCH --mail-type=begin,end
#SBATCH --mail-user=one@email.com
#SBATCH --output=job-%j.out       
#SBATCH --error=job-%j.err       


module purge 
python main.py