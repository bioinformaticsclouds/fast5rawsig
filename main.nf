#!/usr/bin/env nextflow

params.fast5 = "$baseDir/fast5/multi-data/test.fast5"

fast5 = file(params.fast5)

process retrieveSig {  
    
    container 'bioinformaticscloud/f5sigub:latest'
    publishDir "$baseDir/data/" 
    
    input:
    file fast5_file from fast5
 
    output:
    file 'sigRaw.csv' into signals
 
    script:
    """
    getSig.py ${fast5_file} > sigRaw.csv 
    """
}
