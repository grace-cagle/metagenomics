#!/bin/bash

cd /work/gcagle1
module load python/3.6.4-anaconda
source activate megahit-env

megahit -1 trim_output/$1/*_1_1P.fq.gz -2 trim_output/$1/*_1_2P.fq.gz -o assembly_test/$2 --min-count 2 --k-list 27,37,47,57,67,77,87 -t $3

exit
