# How to use SLURM commdands for GPU-Clusters
This is a summary from the [help-center page about slurm commands](https://help.itc.rwth-aachen.de/service/rhr4fjjutttf/article/3d20a87835db4569ad9094d91874e2b4)

## How to write a job script
A job script starts with the line

```bash
#!/usr/local_rwth/bin/zsh
```
After that the parameters below will configure the requested resources for the job:

## Parameters:
Please note that all values that you define with SBATCH directives are hard values. When you, for example, ask for 6000 MB of memory (--mem=6000MB) and your job uses more than that, the job will be automatically killed by the manager. [source](https://hpc-uit.readthedocs.io/en/latest/jobs/examples.html).

You may not place any commands before the last SBATCH parameter.
All parameters are listed [here](https://help.itc.rwth-aachen.de/service/rhr4fjjutttf/article/1f18ef48d8444f15bd908c592e0c44fb).
[More info on accounting](https://help.itc.rwth-aachen.de/service/rhr4fjjutttf/article/090b27dc31484f3c833957978b039b55)
* Job Name:
```bash
-J --job-name=
### Example:
#SBATCH --job-name=train-pong-iterative-agent
```
* Save the output of your job in a file for debuging. File / path where STDOUT will be written.
```bash
-o, --output=
### Example:
#SBATCH --output=outputCFX.txt
```
* Reuest the time you need for execution. The full format is D-HH:MM:SS You must at least specify minutes or days and hours and may add or leave out any other parameters
```bash
-t, --time=d-hh:mm:ss
### Example:
#SBATCH --time=80
```
* Request CPUs:
    * Option1: Request number of CPU
```bash
-n, --ntasks= 
### Example:
#SBATCH --ntasks=8
```
* 
    * Option2: Request number of hosts. Its the number of nodes you need. Each node has 16 or 20 CPU cores.
```bash
-N, --nodes=
### Example:
#SBATCH --nodes=1
```
* Number of cpus per taks
```bash
-c, --cpus-per-task=
### Example:
#SBATCH --cpus-per-task=4
```
* Number of tasks per node
```bash
--ntasks-per-node=
### Example:
#SBATCH --ntasks-per-node=2
```
* Memory needed per allocated CPU, which can be more than the ordered tasks (hybrid jobs!). In MB.
```bash
--mem-per-cpu=
### Example:
#SBATCH --mem-per-cpu=3900
```
###  Parameters for a GPU Job
```bash
# request one gpu per node
--gres=gpu:<type>:1
# request two gpus per node
--gres=gpu:<type>:2
# request two volta gpus (CLAIX18)
--gres=gpu:volta:2
# request two pascal gpus (CLAIX16)
--gres=gpu:pascal:2
# please note that a batch job ordering one GPU must be non-exclisive in order not to block the remaining GPU of the node
```
the right partition will be chosen for you, you do not need to request a partition.

## Writing the job

After the SLURM parameters the real batch should be written

```bash
### load modules and execute
module load cuda/100
module load cudnn/7.4

### Change to the work directory
cd $HOME/MASTERTHESIS/TEST/

### start non-interactive batch job
python test.py
```