#!/usr/bin/env nextflow
// workflow.workDir /workspace/sunhao100/work

//params.fast5 = "${workflow.launchDir}/multi-data/test.fast5"

ch_fast5 = Channel.fromPath("${workflow.launchDir}/data/testdata/*.fast5", checkIfExists: true)

process RETRIEVESIG {  
    container 'bioinformaticscloud/f5sigub:latest'
    publishDir "${workflow.launchDir}/data/output", mode:copy
    
    input:
    path sample from ch_fast5

    output:
    file '*.csv' into ch_outputfiles 
 
    script:
    """
    getSig.py $sample > ${sample.baseName}.csv 
    """
}
