#!/bin/bash

# Get the top level directory of the repository
repo=$(dirname $PWD)

# make output directory if needed
odir="${repo}/data/sample_run"
if [ -d $odir ]; then rm -rf $odir; fi 
mkdir -p $odir 

# Run/Log dir
runDir="${odir}/run"
logDir="${odir}/logs"

# run 
script="${repo}/pipelines/AMIA-ChIP-Seq-Pipeline.bds"

cd $odir && /usr/bin/time -v -o 2016-AMIA-ChIPSeq-Run.time \
bds $script -configFile ${repo}/pipelines/config/chipseq.cfg \
-contrastFiles ${repo}/pipelines/config/contrast.Ab1.input.cfg \
${repo}/pipelines/config/contrast.Ab1.IgG.cfg \
-runDir $runDir -logDir $logDir > 2016-AMIA-ChIPSeq-Run.logs 2>&1
