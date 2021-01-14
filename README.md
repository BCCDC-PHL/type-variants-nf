# type-variants-nf

## Summary
This pipeline is used to run the 'typing' portion of connor-lab/ncov2019-artic-nf to detect SARS-CoV-2 'variants of concern'.

## Usage

```
nextflow run main.nf \
  --variants_dir </path/to/variants.tsv files> \
  --ref </path/to/MN908947.3.fasta> \
  --gff </path/to/MN908947.3.gff> \
  --yaml </path/to/SARS-CoV-2.types.yaml> \
  --outdir <output_directory> \
  --prefix <output filename prefix>
```

## Example Output

Output directory structure:

```
<prefix>.typing_summary.csv
<prefix>.variant_summary.csv
ncovIllumina_Genotyping_typeVariants/typing
ncovIllumina_Genotyping_typeVariants/variants
ncovIllumina_Genotyping_typeVariants/vcf
```

### Output file formats

`<prefix>.typing_summary.csv`

One file per analysis, containing info on all samples and variants ('types'):

| sampleID | type | num_matching_vars | num_missing_vars | type_coverage | found_vars | missing_vars | additional_vars |
|----------|------|-------------------|------------------|---------------|------------|--------------|-----------------|
|          |      |                   |                  |               |            |              |                 |

`<prefix>.variant_summary.csv`

| sampleID | gene | aa_var | dna_var |
|----------|------|--------|---------|
|          |      |        |         |

`ncovIllumina_Genotyping_typeVariants/typing/<sampleID>.typing.csv`

One file per sample, same format as `<prefix>.typing_summary.csv`. Output only produced if a type is 'called' for the sample.
The calling criteria are defined by the `coverage` entry in the `.yaml` file that defines the variants.:

| sampleID | type | num_matching_vars | num_missing_vars | type_coverage | found_vars | missing_vars | additional_vars |
|----------|------|-------------------|------------------|---------------|------------|--------------|-----------------|
|          |      |                   |                  |               |            |              |                 |

`ncovIllumina_Genotyping_typeVariants/variants/<sampleID>.variants.csv`

| sampleID | gene | aa_var | dna_var |
|----------|------|--------|---------|
|          |      |        |         |

`ncovIllumina_Genotyping_typeVariants/vcf/<sampleID>.csq.vcf`

[VCF format](https://samtools.github.io/hts-specs/VCFv4.2.pdf) storing nucleotide substitutions along with consequence info.
