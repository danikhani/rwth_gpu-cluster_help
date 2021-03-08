#!/usr/local_rwth/bin/zsh
 
### Job name
#SBATCH --job-name=epose_100
 
### File / path where STDOUT will be written, the %J is the job id
#SBATCH --output=logs/epose_100.%J.log

### Request the time you need for execution. The full format is D-HH:MM:SS
### You must at least specify minutes or days and hours and may add or
### leave out any other parameters
#SBATCH --time=23:00:00

#SBATCH --mail-type=ALL
#SBATCH --mail-user=max.muster@rwth-aachen.de

### number of cpus
#SBATCH --cpus-per-task=4

### Request memory you need for your job in MB
#SBATCH --mem-per-cpu=4G

### load number of gpus
#SBATCH --gres=gpu:1


### load modules and execute
module switch intel gcc
module load cuda/101
module load cudnn/7.6.5

### print some debug informations...
echo; export; echo;  nvidia-smi; echo

### Run conda
source conda3/bin/activate
conda init
conda activate epose

### Run the job
cd Dokumente/efficientpose/epose_com

python train.py --phi 0 --epochs 100 --weights weights/COCO/efficientdet-d0.h5 linemod dataset/linemod/ --object-id 18

echo "Script completed."
