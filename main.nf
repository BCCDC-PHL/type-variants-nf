#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include {Genotyping} from './workflows/typing.nf'

workflow ncovIllumina {
  take:
    ch_variants_files
    ch_gff
    ch_ref
    ch_yaml
  
  main:
    Genotyping(ch_variants_files, ch_gff, ch_ref, ch_yaml)
}

workflow {
  Channel.fromFilePairs( "${params.variants_dir}/*.variants.tsv", size: 1, flat: true ).set{ ch_variants_files }
  Channel.fromPath( params.ref ).set{ ch_ref }
  Channel.fromPath( params.gff ).set{ ch_gff }
  Channel.fromPath( params.yaml ).set{ ch_yaml }
  
  ch_ref_data = ch_gff.combine(ch_ref).combine(ch_yaml)

  main:
    ncovIllumina(ch_variants_files, ch_gff, ch_ref, ch_yaml)
}