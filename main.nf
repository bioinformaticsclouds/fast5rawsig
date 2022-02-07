#!/usr/bin/env nextflow
// workflow.workDir /workspace/sunhao100/work
ch_fast5 = Channel.fromPath("${workflow.launchDir}/data/testdata/*.fast5", checkIfExists: true)

process RETRIEVESIG {
    pod runAsUser:1001  
    container 'bioinformaticscloud/f5sigub:latest'
    publishDir "${workflow.launchDir}/myoutput", mode: 'copy'
    
    input:
    path sample from ch_fast5

    output:
    file '*.csv' into ch_outputfiles 
 
    script:
    """
    getSig.py $sample > ${sample.baseName}.csv 
    """
}
