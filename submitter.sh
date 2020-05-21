#!/bin/bash

#$ -S /bin/bash
#$ -cwd
#$ -j y
#$ -M wt99@drexel.edu
#$ -P rosenclassPrj
#$ -pe shm 32
#$ -l h_rt=48:00:00
#$ -l h_vmem=7.5G
#$ -l m_mem_free=7G
#$ -q all.q

. /etc/profile.d/modules.sh
. /home/wt99/.bashrc

module load shared
module load proteus
module load sge/univa
module load gcc
module load rosenclassGrp-kraken2
module load ncbi-blast/gcc/64/2.6.0

kraken2-build --standard --threads 31 --db /lustre/scratch/wt99/database

kraken2 --db /lustre/scratch/wt99/database Sample_EL5602_F1_HL-P_FIB.R1.trimmed.fastq > test.kraken2
