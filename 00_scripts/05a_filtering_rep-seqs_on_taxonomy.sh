#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g
#PBS -o /home1/datawork/creisser/ECOPE/98_log_files
#PBS -N qiime2_rep-seqs_tax_filter

DATADIR=/home1/datawork/creisser/ECOPE/04_qiime_16S

source activate qiime2-2018.11

qiime taxa filter-seqs \
  --i-sequences $DATADIR/16S_rep-seqs.qza \
  --i-taxonomy $DATADIR/16S_taxonomy.qza \
  --p-include D_1__ \
  --p-exclude eukaryota,mitochondria,chloroplast \
  --o-filtered-sequences $DATADIR/16S_rep-seqs_filtered_D1_euk_mit_chlo.qza

source deactivate
