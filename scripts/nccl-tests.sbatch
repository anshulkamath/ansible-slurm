#!/bin/bash
#SBATCH --job-name=nccl_tests
#SBATCH --output=/mnt/ubuntu/nccl-output.out
#SBATCH --error=/mnt/ubuntu/nccl-errors.out
#SBATCH --nodes=2
#SBATCH --gres=gpu:1   # Request 1 GPU per node
#SBATCH --time=00:10:00

MOUNT=/mnt/ubuntu
NCCL_DIR=$MOUNT/nccl-tests

if [[ ! -d $NCCL_DIR ]]; then
    git clone https://github.com/NVIDIA/nccl-tests.git $NCCL_DIR
fi

cd $NCCL_DIR

make

for ex in `find $NCCL_DIR/build -type f -executable`; do
    echo $ex
    srun -N 2 $ex
done
