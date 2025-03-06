#!/bin/bash
#SBATCH --job-name=gpu_test
#SBATCH --output=/mnt/slurm/slurm-%j.out
#SBATCH --nodes=2
#SBATCH --gres=gpu:1   # Request 1 GPU per node
#SBATCH --ntasks-per-node=1
#SBATCH --time=00:10:00

srun sleep $(( (RANDOM % 5) + 1)) &
srun hostname -s &
srun nvidia-smi &
wait

