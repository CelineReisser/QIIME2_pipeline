#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g
#PBS -o /home1/datawork/creisser/ECOPE/98_log_files
#PBS -N qiime2_denoise

cd /home1/datawork/creisser/ECOPE/

source activate qiime2-2018.11

OUT=/home1/datawork/creisser/ECOPE/04_qiime_16S

qiime dada2 denoise-paired \
--i-demultiplexed-seqs $OUT/16S_ecope.qza
--p-trunc-len-f 250 \
--p-trunc-len-r 250 \
--o-table $OUT/16S_table.qza
--o-representative-sequences 16S_rep-seqs.qza
--o-denoising-stats 16S__denoising-stats.qza

source deactivate qiime2-2018.11

