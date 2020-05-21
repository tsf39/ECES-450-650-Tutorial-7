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

cat ../../test.kraken2 | cut -f 2,3 > test.kraken2.krona

ktImportTaxonomy test.kraken2.krona
