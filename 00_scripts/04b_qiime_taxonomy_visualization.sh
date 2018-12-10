#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g
#PBS -o /home1/datawork/creisser/ECOPE/98_log_files
#PBS -N qiime2_taxonomy_visualization

source activate qiime2-2018.11

DATADIR=/home1/datawork/creisser/ECOPE/04_qiime_16S
REF=/home1/datawork/creisser/ECOPE/01_info_files/silva-132-99-nb-classifier.qza

cd $DATADIR


qiime metadata tabulate --m-input-file 16S_taxonomy.qza --o-visualization 16S_taxonomy.qzv

source deactivate


