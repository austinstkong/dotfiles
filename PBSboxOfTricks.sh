#!/bin/bash
# List of handy PBS commands
# Austin Kong
# Last updated 2015 08 01

# Clear any modules that may have been globally .
module avail
module list
module purge
module add intel
module rm matlab/2011b
module help mrbayes
module show nag/CLL6A23DGL
module switch matlab/2013a matlab/2012b

# Interactive jobs / with graphics
qsub -I -l nodes=1:ppn=1,vmem=8gb,walltime=1:00:00
qsub -I -X

# Flags
#nodes 	Number of compute nodes that you want the job to run on. Default is 1 node. Other options appear below.
#vmem 	The total amount of memory you require. Do NOT use when requesting more than 1 node. Default is 1Gb.
#pvmem 	The amount of memory per core for a multinode job.
#walltime 	The expected run time for the job in the form HH:MM:SS. Default is 1:00:00 (1 hour).

# Job Deletion
qdel qselect -u $USER | xargs qdel qselect -u $USER -s R | xargs qdel qselect -u $USER -s Q | xargs qdel

# Expected start
showres -n JOBID
showres -n | grep JOBID
# Show idle
showq -i
# If you want to know why the jobs in the idle queue are in the order that they are
diagnose -p
# Node status with headers
pestat | grep -E 'node|kc08b03'


# If you want to see the status of the jobs that you have submitted then you can use the qstat command. For example
qstat -u $USER
# will show you the status of all of your jobs. If you type
qstat
# then you will see a list of every job running on the cluster. Once you have a Job ID you can then use the command
qstat -f JOBID
# to get details on how your job is going including elapsed time, CPU time and max memory usage. To find out more about available options type man qstat to see the full list of what you can see with the qstat command.
# If your job doesn't want to run then you can see what is stopping it from running using the checkjob command. Type
checkjob JOBID
# to see a summary of the status of a particular job. If there is something that is stopping your job from running there will be a message at the bottom telling you what is going on.
# If you want even more detail you can use the tracejob command by running
tracejob JOBID
# which will then give you information on the history of the job from the scheduler's point of view.
# When your job is running STDOUT (what you would normally see on the screen if your job was run from the command line) and STDERR (any error messages that are generated) are copied to your cluster home drive when the job completes. See here for more information.
# The qpeek command allows you to see those files whilst the job is running. Simply type
qpeek -f JOBID
# for STDOUT and
qpeek -e JOBID
# to see the STDERR.
# To see a complete list of jobs running and queued you can use the
showq
# command. Typing it will show you the the jobs that are active (i.e. currently running on a compute node), idle (i.e. waiting for the required resources to become available on a node that can be used by the job) and blocked (i.e. currently being blocked from running due to the number of cores or amount of memory available to the individual or research group already being used). For more information have a look at the job scheduling and queues page.
# The 
pestat
# command allows you to list all the nodes of the cluster along with what jobs are running on those nodes, node memory usage, node load and if a node is able to accept more jobs.

# Set filename for output and err file
#PBS -j oe
#PBS -o /home/z1234567/results/Output_Report

# Seperate named out/err files
#PBS -o /home/z1234567/results/Output_Report
#PBS -o /home/z1234567/results/Error_Report

# https://www.hpc.science.unsw.edu.au/about/making-use-local-scratch
# Making use of Local Scratch 

#! /bin/bash
# prologue
echo "prologue: copy from working directory to local scratch"
echo "    ${PBS_O_WORKDIR}"
echo "    ${TMPDIR}"
echo
 
rm -rf ${PBS_O_WORKDIR}/out
rsync -a ${PBS_O_WORKDIR}/ ${TMPDIR}

#! /bin/bash
# epilogue
 
echo "epilogue: copy from local scratch to working directory"
echo "    ${TMPDIR}"
echo "    ${PBS_O_WORKDIR}"
echo
 
rsync -a ${TMPDIR}/ ${PBS_O_WORKDIR}/out

#! /bin/bash
# job.sh

#PBS -l prologue=/srv/scratch/z1234567/prologue
#PBS -l epilogue=/srv/scratch/z1234567/epilogue
