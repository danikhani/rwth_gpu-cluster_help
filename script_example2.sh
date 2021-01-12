#!/usr/local_rwth/bin/zsh

#SBATCH --job-name=iwmpm-jupyterlab
#SBATCH --output=logs/output_%J.txt
#SBATCH --time=08:00:00
#SBATCH --cpus-per-task=24
#SBATCH --mem-per-cpu=4G
#SBATCH --gres=gpu:1

module switch intel gcc # This is recommended
module load cuda/100
module load cudnn/7.4

source $HOME/RP1/cleaned_src/venv/bin/activate

node=$(hostname -s)
port=8989

echo -e "
The server is $node.
The port is $port

To connect to the Jupyter instance you need to first set up a ssh tunnel from the node to your own computer.
Running this command does just that:
ssh -N -L ${port}:${node}:${port} ${USER}@login.hpc.itc.rwth-aachen.de
and log in with your password."

jupyter lab --no-browser --ip=$node --port=$port