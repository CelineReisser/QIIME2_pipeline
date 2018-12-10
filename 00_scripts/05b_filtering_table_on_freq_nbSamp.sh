#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g
#PBS -o /home1/datawork/creisser/ECOPE/98_log_files
#PBS -N qiime2_table_freq_sampNb_filter

DATADIR=/home1/datawork/creisser/ECOPE/04_qiime_16S

source activate qiime2-2018.11

qiime feature-table filter-features \
  --i-table $DATADIR/16S_table.qza \
  --p-min-frequency 10 \
  --p-min-samples 2 \
  --o-filtered-table $DATADIR/16S_filtered_table.qza

source deactivate
