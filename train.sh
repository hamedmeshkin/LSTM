#!/bin/sh
#$ -P CDERID0047
#$ -S /bin/bash
#$ -cwd
#$ -j y
#$ -l gpus=4                    # 1 GPU required (per thread!)
#$ -pe thread 1                 
#$ -N cudnnLSTM_TENSORFLOW
#$ -o LOGS/
#$ -l h_rt=48:00:00
#$ -l h_vmem=400G

echo "==== start of job $JOB_NAME ($JOB_ID) at: " `date` " on host " `hostname`
echo

echo check for gpu: nvidia-smi output:
nvidia-smi
echo

# Get start of job information
START_TIME=`date +%s`
export LD_LIBRARY_PATH=/projects/mikem/applications/GPU/cudnn/cuda/lib64:$LD_LIBRARY_PATH

/home/seyedhamed.meshkin/Anaconda/anaconda3/bin/python3.6 simpleblock_mirrormodel_training.py > LOGS/"$JOB_NAME".o"$JOB_ID".stoste 2>&1
#/home/lizhi/setup/anaconda3/bin/python3.6 LSTM_train.py > LOGS/"$JOB_NAME".o"$JOB_ID".stoste 2>&1

# Get end of job information
EXIT_STATUS=$?
END_TIME=`date +%s`


