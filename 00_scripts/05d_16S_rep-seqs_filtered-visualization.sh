#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g
#PBS -o /home1/datawork/creisser/ECOPE/98_log_files
#PBS -N rep-seqs_filtered-visualization

DATADIR=/home1/datawork/creisser/ECOPE/04_qiime_16S
source activate qiime2-2018.11
qiime feature-table tabulate-seqs --i-data $DATADIR/16S_rep-seqs_filtered_D1_euk_mit_chlo.qza --o-visualization $DATADIR/16S_rep-seqs_filtered_D1_euk_mit_chlo.qzv

deactivate qiime2-2018.11
