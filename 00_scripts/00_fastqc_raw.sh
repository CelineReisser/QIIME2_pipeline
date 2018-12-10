DATADIRECTORY=/home1/datawork/creisser/ECOPE/02_data/raw_reads
DATAOUTPUT=/home1/datawork/creisser/ECOPE/02_data/fastqc_raw
SCRIPT=/home1/datawork/creisser/ECOPE/00_scripts/00_fastqc_raw_scripts
HEADER=/home1/datawork/creisser/ECOPE/00_scripts/header.txt
FASTQCENV=". /appli/bioinfo/fastqc/latest/env.sh"

mkdir -p $SCRIPT
mkdir -p $DATAOUTPUT

cd $DATADIRECTORY
for FILE in $(ls *.fastq.gz)
do
        cp $HEADER $SCRIPT/fastqc_${FILE##*/}.qsub ;
        echo "#PBS -N fastqc_raw" >> $SCRIPT/fastqc_${FILE##*/}.qsub ;
        echo "cd $DATADIRECTORY" >> $SCRIPT/fastqc_${FILE##*/}.qsub ;
        echo "$FASTQCENV"  >> $SCRIPT/fastqc_${FILE##*/}.qsub ;
        echo "fastqc $FILE -o $DATAOUTPUT" >> $SCRIPT/fastqc_${FILE##*/}.qsub ;
        qsub $SCRIPT/fastqc_${FILE##*/}.qsub ;
done ;

