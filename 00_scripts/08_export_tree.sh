#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g
#PBS -o /home1/datawork/creisser/ECOPE/98_log_files
#PBS -N qiime2_Tree_making

source activate qiime2-2018.11

DATADIR=/home1/datawork/creisser/ECOPE/04_qiime_16S
cd $DATADIR


qiime tools export \
  --input-path unrooted-tree__16S_rep-seqs_filtered_D1_euk_mit_chlo.qza \
  --output-path exported_tree

mv $DATADIR/exported_tree/tree.nwk $DATADIR/phyloseq_input_files/unrooted-tree_16S.nwk

qiime tools export \
  --input-path rooted-tree__16S_rep-seqs_filtered_D1_euk_mit_chlo.qza \
  --output-path exported_tree

mv $DATADIR/exported_tree/tree.nwk $DATADIR/phyloseq_input_files/rooted-tree_16S.nwk

