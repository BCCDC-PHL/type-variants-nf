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

```
<prefix>.typing_summary.csv
<prefix>.variant_summary.csv
ncovIllumina_Genotyping_typeVariants/typing
ncovIllumina_Genotyping_typeVariants/variants
ncovIllumina_Genotyping_typeVariants/vcf
```