#!/bin/bash

idir="/home/ubuntu/data/chipseq/fullset/fastqc"

# Get the top level directory of the repository
repo=$(dirname $(dirname $PWD))
odir="${repo}/data"

# run
multiqc="/home/ubuntu/anaconda2/envs/multiqc/bin/multiqc"
cd $idir && $multiqc -d --title "ChIP Seq Dataset" -f -o $odir . 
