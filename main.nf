#!/usr/bin/env nextflow
// workflow.workDir /workspace/sunhao100/work

//params.fast5 = "${workflow.launchDir}/multi-data/test.fast5"

ch_fast5 = Channel.fromPath("${workflow.launchDir}/testdata/*.fast5")

process RETRIEVESIG {  
    
    container 'bioinformaticscloud/f5sigub:latest'
    publishDir "$baseDir/data/", mode:link
    
    input:
    path sample from ch_fast5

    output:
    file '*.csv' into ch_outputfiles 
 
    script:
    """
    getSig.py $sample > ${sample.baseName}.csv 
    """
}
