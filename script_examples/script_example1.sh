#!/usr/local_rwth/bin/zsh

### Job name
#SBATCH --job-name=train-pong-iterative-agent

### File / path where STDOUT will be written, the %J is the job id
#SBATCH --output=logs/train_pong_%J.txt

### Request the time you need for execution. The full format is D-HH:MM:SS
### You must at least specify minutes or days and hours and may add or
### leave out any other parameters
#SBATCH --time=23:59:00

#SBATCH --cpus-per-task=4

### Request memory you need for your job in MB
#SBATCH --mem-per-cpu=32G

#SBATCH --gres=gpu:pascal:1


module load cuda
module load cudnn/7.4

source ../../venv/bin/activate

cd ../../WorldModels

while true; do
echo "Starting training."

python train.py --game_str "Pong" --base_dir "/hpcwork/hl669674/Pong" --file_name "Pong"
done

echo "Script completed."


###################### meanings#########################

### Time your job needs to execute, e. g. 2 days
#SBATCH --time=96:00:00

### Account type
#SBATCH --account=um_dke

### Memory your job needs per node
#SBATCH --mem=40G

### Use one node for parallel jobs on shared-memory systems
#SBATCH --nodes=1

### Number of threads to use
#SBATCH --cpus-per-task=12

### Number of hyperthreads per core
#SBATCH --ntasks-per-core=1

### Tasks per node (for shared-memory parallelisation, use 2)
#SBATCH --ntasks-per-node=1

### The last part consists of regular shell commands:
### Set the number of threads in your cluster environment to the value specified above
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

### Source bashrc
source ~/.bashrc

### Run train.py
### $1 is the argument for specifying the game which is used for the training
### $2 is the argument for specifying the log path
### $3 is the argument for specifying the importance of the reconstruction loss
python train.py $1 $2 $3