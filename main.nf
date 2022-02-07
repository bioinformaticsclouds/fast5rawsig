#!/usr/bin/env nextflow
// workflow.workDir /workspace/sunhao100/work

//params.fast5 = "${workflow.launchDir}/multi-data/test.fast5"

fast5 = Channel.fromPath("${workflow.launchDir}/testdata/*.fast5")
name = Channel.fromPath("${workflow.launchDir}/testdata/*.fast5")

process retrieveSig {  
    
    container 'bioinformaticscloud/f5sigub:latest'
    publishDir "$baseDir/data/" 
    
    input:
    file sample from fast5

    output:
    file 'out.csv' into outputfiles 
 
    script:
    """
    getSig.py $sample >> out.csv 
    """
}
