#!/usr/local_rwth/bin/zsh
 
### Job name
#SBATCH --job-name=effPose
 
### File / path where STDOUT will be written, the %J is the job id
#SBATCH --output=effPose.%J.log

### Request the time you need for execution. The full format is D-HH:MM:SS
### You must at least specify minutes or days and hours and may add or
### leave out any other parameters
#SBATCH --time=23:59:00

### number of cpus
#SBATCH --cpus-per-task=4

### Request memory you need for your job in MB
#SBATCH --mem-per-cpu=4G

### load number of gpus
#SBATCH --gres=gpu:1


### load modules and execute
module load cuda/100
module load cudnn/7.6

#print some debug informations...
echo; export; echo;  nvidia-smi; echo

# run the job

source ../../venv/bin/activate

cd ../../WorldModels

while true; do
echo "Starting training."

python train.py --game_str "Pong" --base_dir "/hpcwork/hl669674/Pong" --file_name "Pong"
done

echo "Script completed."