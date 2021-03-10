# RWTH Linux GPU-Cluster Help

This is a quick start for using the rwth cluster. Most of the details are summrized from [RWTH-Docs](https://help.itc.rwth-aachen.de/service/rhr4fjjutttf), [HPC-WIKI](https://hpc-wiki.info/hpc/HPC_Wiki) or are from emails from the IT-Center.

## Loging in and Access
This has been explained really well [here](https://help.itc.rwth-aachen.de/service/rhr4fjjutttf/article/04d4da051b004a208c92c1ce216b116a)

Select a node from [here](https://help.itc.rwth-aachen.de/service/rhr4fjjutttf/article/3fb4cb953142422dbbb656c1c3253cff) and use the following for login
ssh login:
```bash
ssh -l userid login-g.hpc.itc.rwth-aachen.de
```

## How to use it

Imagine the system like this: After logging in via ssh you have a Linux Pc environment. You can use this space to load your data and install the needed programs like conda. You can't run anything for too long in this environment since it's for testing. This environment will be shared across all login nodes. You can use your job-script.sh to access data and programs on this environment and also to save logs or resaults in this envoirment. Later on the data can be transfered with FTP to your PC. 

There are two modes for using the GPU-Clusters:

* For using non-thrivial amount of compute time using GPUs you are obliged to use the batch system see [here](https://help.itc.rwth-aachen.de/service/rhr4fjjutttf/article/f9cc426c044145078905a694403d867f/).

* There is also a possiblity to use GPUs for interactive tests, see [here](https://help.itc.rwth-aachen.de/service/rhr4fjjutttf/article/a1beccd9e9dc4044a740ed248f478839/). Note that these tests must be *SHORT* and not too many. The two interacite [front ends](https://help.itc.rwth-aachen.de/service/rhr4fjjutttf/article/3fb4cb953142422dbbb656c1c3253cff/) are equipped with GPUIs are for testing only and not for production jobs of any extent.

The limitation of both mods are written [here](https://help.itc.rwth-aachen.de/service/rhr4fjjutttf/article/20919ea3f07f4c9da581532def08c35f/)

## How to apply for GPU-Resources
'Small use' is available with the free quota, see [here](https://help.itc.rwth-aachen.de/service/rhr4fjjutttf/article/45825b06afb647e194be4a5b9f5b8768/) and [here](https://www.itc.rwth-aachen.de/hpc-projects). Please start with this. If you would need more ressources so file in a project proposal. 
Remember that only some 5% of our nodes are equipped with GPUs. So If your code is able to run well on CPUs, avoid use of GPUs! It is only profitable to use GPUs if it make the excution (significantly!) faster on a full node withour GPUs. 

## Using Cuda 
It is possible to switch the cuda versions as written [here](https://help.itc.rwth-aachen.de/service/rhr4fjjutttf/article/85966da9155f4042877b536fa494b489/). For that its important to read and understand the [module system](https://help.itc.rwth-aachen.de/service/rhr4fjjutttf/article/417f822b8a7849eb8c9c2753045ad67f/)
**Essential background**: loading a module does not change any installation by itself, but it make some software available for use by changing environment variables.
##### Some usefull commands:
* Show available cuda versions:
```shell
module avail cuda 
```
* load a specific cuda version. here cuda11
```shell
module load cuda11
```
* show the location of the loaded cuda
```shell
echo $CUDA_ROOT
```
## Using Conda 
Since conda will be installed in $Home, there wont be any problem installing it for your user. the '--user' can used to stay in userspace.

## Applying the job
after writing the job.sh file. You can apply this job with:
```shell
sbatch job.sh
```
Seeing the status of your jobs:
```shell
squeue -u userID
```
See predicted starting time of your jobs:
```shell
squeue -u userID --start
```
get the live update from the log file:
```shell
tail -f /path/logfile.log
```
get the 100 last lines from the log file:
```shell
tail -n 100 /path/logfile.log
```
## Job Examples
Tow good job script examples are written here:

https://github.com/SamSweere/Covid19-News-Analysis/wiki/RWTH-GPU-Cluster-stuff
https://github.com/pfackeldey/Machine-Learning/wiki/GPU-Batch-System

https://help.itc.rwth-aachen.de/service/rhr4fjjutttf/article/1774cf956ee34bafb2cade94cdef0949

## Connecting with FTP to transfer files
Its also possible to use FTP with your prefered programm like FileZilla to transfer files from your PC to the clusters or vice versa. 
https://help.itc.rwth-aachen.de/service/rhr4fjjutttf/article/db3e5fd39d1d42c9815b4fa689719ac9/

```shell
xy123456@copy.hpc.itc.rwth-aachen.de
port: 22
```

