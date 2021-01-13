#### THIS IS A CPU SCRIPT!!

#!/usr/local_rwth/bin/zsh
 
### Job name
#SBATCH --job-name=CFX_MPI
 
### File / path where STDOUT will be written, the %J is the job id
#SBATCH --output=outputCFX.txt
 
### Request the time you need for execution. The full format is D-HH:MM:SS
### You must at least specify minutes or days and hours and may add or
### leave out any other parameters
#SBATCH --time=80
 
### Request memory you need for your job in MB
#SBATCH --mem-per-cpu=3900
 
### Request number of hosts
#SBATCH --nodes=1
   
### Request number of CPUs
#SBATCH --ntasks=8
 
### Change to the work directory
cd $HOME/MASTERTHESIS/TEST/

### load modules and execute
module load TECHNICS
module load ansys
 
### start non-interactive batch job
cfx5solve -def testCFX_files/dp0/CFX/CFX/Fluiddynamik\ CFX.def -par-dist "$R_WLM_CFXHOSTLIST" -start-method "Intel MPI Distributed Parallel"