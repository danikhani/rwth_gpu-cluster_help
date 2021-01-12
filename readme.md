# RWTH Linux GPU-Cluster Help

This is a quick start for using the rwth cluster. Most of the details are summrized from [RWTH-Docs](https://help.itc.rwth-aachen.de/service/rhr4fjjutttf), [HPC-WIKI](https://hpc-wiki.info/hpc/HPC_Wiki) or are from emails from the IT-Center.

## Loging in and Access
This has been explained really well [here](https://help.itc.rwth-aachen.de/service/rhr4fjjutttf/article/04d4da051b004a208c92c1ce216b116a)

## How to use it
There are two modes for using the GPU-Clusters:

* For using non-thrivial amount of compute time using GPUs you are obliged to use the batch system see [here](https://help.itc.rwth-aachen.de/service/rhr4fjjutttf/article/f9cc426c044145078905a694403d867f/).

* There is also a possiblity to use GPUs for interactive tests, see [here](https://help.itc.rwth-aachen.de/service/rhr4fjjutttf/article/a1beccd9e9dc4044a740ed248f478839/). Note that these tests must be *SHORT* and not too many. The two interacite [front ends](https://help.itc.rwth-aachen.de/service/rhr4fjjutttf/article/3fb4cb953142422dbbb656c1c3253cff/) are equipped with GPUIs are für testing only and not for production jobs of any extent.

The limitation of both mods are written [here](https://help.itc.rwth-aachen.de/service/rhr4fjjutttf/article/20919ea3f07f4c9da581532def08c35f/)

## How to apply for GPU-Resources
'Small use' is available with the free quota, see [here](https://help.itc.rwth-aachen.de/service/rhr4fjjutttf/article/45825b06afb647e194be4a5b9f5b8768/) and [here](https://www.itc.rwth-aachen.de/hpc-projects). Please start with this. If you would need more ressources so file in a project proposal. 
Remember that only some 5% of our nodes are equipped with GPUs. So If your code is able to run well on CPUs, avoud use of GPUs! It is only profitable to use GPUs if it make the excution (significantly!) faster on a full node withour GPUs. 

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



