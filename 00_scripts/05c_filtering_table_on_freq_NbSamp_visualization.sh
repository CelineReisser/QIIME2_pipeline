#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g
#PBS -o /home1/datawork/creisser/ECOPE/98_log_files
#PBS -N qiime2_taxonomy_visualization

source activate qiime2-2018.11

DATADIR=/home1/datawork/creisser/ECOPE/04_qiime_16S
META=/home1/datawork/creisser/ECOPE/01_info_files/sample_metadata_16S.txt

cd $DATADIR

qiime feature-table summarize --i-table $DATADIR/16S_filtered_table.qza --o-visualization $DATADIR/16S_filtered_table.qzv --m-sample-metadata-file $META

source deactivate


