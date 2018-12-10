#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g
#PBS -o /home1/datawork/creisser/ECOPE/98_log_files
#PBS -N qiime2_BIOM_prep

source activate qiime2-2018.11

DATADIR=/home1/datawork/creisser/ECOPE/04_qiime_16S
cd $DATADIR

qiime tools export --input-path $DATADIR/16S_filtered_table.qza --output-path $DATADIR/exported_16S_filtered_table
qiime tools export --input-path $DATADIR/16S_taxonomy.qza --output-path $DATADIR/exported_16S_taxonomy

biom convert -i $DATADIR/exported_16S_filtered_table/feature-table.biom -o $DATADIR/16S_filtered_table.tsv --to-tsv

cp $DATADIR/exported_16S_taxonomy/taxonomy.tsv $DATADIR/exported_16S_taxonomy/biom-taxonomy.tsv
sed -i '1c\OTUID taxonomy confidence' $DATADIR/exported_16S_taxonomy/biom-taxonomy.tsv

mkdir -p phyloseq_input_files
cp $DATADIR/16S_filtered_table.tsv ./phyloseq_input_files
cp $DATADIR/exported_16S_taxonomy/biom-taxonomy.tsv ./phyloseq_input_files

source deactivate


