#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g
#PBS -o /home1/datawork/creisser/ECOPE/98_log_files
#PBS -N qiime2_Tree_making

source activate qiime2-2018.11

DATADIR=/home1/datawork/creisser/ECOPE/04_qiime_16S
cd $DATADIR

qiime phylogeny align-to-tree-mafft-fasttree \
  --i-sequences 16S_rep-seqs_filtered_D1_euk_mit_chlo.qza \
  --o-alignment aligned_16S_rep-seqs_filtered_D1_euk_mit_chlo.qza \
  --o-masked-alignment masked_16S_rep-seqs_filtered_D1_euk_mit_chlo.qza \
  --o-tree unrooted-tree__16S_rep-seqs_filtered_D1_euk_mit_chlo.qza \
  --o-rooted-tree rooted-tree__16S_rep-seqs_filtered_D1_euk_mit_chlo.qza

