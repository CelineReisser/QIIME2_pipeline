#!/usr/bin/env bash
#PBS -q omp
#PBS -l ncpus=4
#PBS -l mem=23gb
#PBS -l walltime=24:00:00
#PBS -o /home1/datawork/creisser/ECOPE/98_log_files
#PBS -N qiime2_input

cd /home1/datawork/creisser/ECOPE/

source activate qiime2-2018.11

INDIR=/home1/datawork/creisser/ECOPE/01_info_files
OUTDIR=/home1/datawork/creisser/ECOPE/04_qiime_16S

mkdir -p $OUTDIR


qiime tools import \
  --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-path $INDIR/manifest_file_16S.csv \
  --output-path $OUTDIR/16S_ecope.qza \
  --input-format PairedEndFastqManifestPhred33


source deactivate qiime2-2018.11




