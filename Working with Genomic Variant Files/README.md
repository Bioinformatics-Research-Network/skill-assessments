# Working with Genomic Variant Files <img src="Sage_Logo.png" align="right" alt="Sage Logo" width="240" style = "border: none; float: right;">


Pre-requisites: [Linux for Bioinformatics](https://github.com/Bioinformatics-Research-Network/skill-assessments/tree/main/Linux%20for%20Bioinformatics) and 
[R Programming](https://github.com/Bioinformatics-Research-Network/skill-assessments/tree/main/R%20Programming)

---

This training module was written by Sasha Scott ([@ajs3nj](https://github.com/ajs3nj)) at Sage Bionetworks. Funding was provided by the Children's Tumor Foundation ([CTF-2021-04-007](https://doi.org/10.48105/pc.gr.150998)). 

---

## Computational requirements

The computing requirements for this assessment are low and it can be completed on a standard laptop or tablet.

If you are on a windows computer, you may need to perform the following steps using WSL2. See the instructions for setting that up [here](https://learn.microsoft.com/en-us/windows/wsl/install).

If you find that you lack the computing resources necessary to complete this or cannot use WSL2, just let Henry know and he will provide you with a suitable virtual machine to use.

# Instructions

The purpose of this module is to understand and utilize some of the most common filetypes generated from genomic data: Variant Call Format (VCF) and Mutation Annotation Format (MAF). The purpose of this challenge is to learn to interpret variant calls when presented in these formats and to manipulate these file types. Wherever you are asked to answer a question, answer it in a separate markdown file called `answers.md`. You will need to send your answers to Henry in order to complete this training.

For example, if I asked:

    Q1. What are the different line types and how are they designated in a VCF file?

This would be what I expect to see in answers.md:

    Q1: What are the different line types and how are they designated in a VCF file?
    A: VCF files contain meta-information lines prefixed with '##', a header line prefixed with '#', and data lines each containing information about a position in the genome and genotype information on samples for each position (with the text fields separated by tabs).

See an example in `answer_example.md` within this directory.


## Variant Call Format (VCF) files

Variant Call Format, or VCF, is a standardized text file format to represent variant calls including SNPs, indels, and structural variants. This [paper](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3137218/) describes the VCF file format and you can find the official VCF specifications [here](https://github.com/samtools/hts-specs/blob/master/VCFv4.3.pdf). This [video](https://www.youtube.com/watch?v=Qgb4Ja5VnUQ) provides a brief introduction to VCF files. Please spend some time using the linked resources to familiarize yourself with the VCF file format.

In this module we will utilize a VCF file generated as part of the 1000 Genomes Project pilot analyses that can be obtained from this ftp site: `http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/pilot_data/release/2010_07/exon/snps/CEU.exon.2010_03.genotypes.vcf.gz`. Go ahead and download this file using `wget` or `curl` and spend some time looking through it.

Due to their unique formatting, we recommend using tools specifically designed to work with genomic variant files instead of `sed/awk` or other default Linux commands. For this tutorial, we will use `tabix`, which is included in the [htslib](https://github.com/samtools/htslib) package and [bcftools](https://github.com/samtools/bcftools) to manipulate our VCF file. Go ahead and install these tools using mamba (if you need to install `mamba`, please see their [install documentation](https://mamba.readthedocs.io/en/latest/installation.html):

```shell
# replace <env_name> with the name of the mamba environment you are creating.
mamba create -n <env_name> -c bioconda htslib bcftools
mamba activate <env_name>
```

This [introduction](https://samtools.github.io/bcftools/howtos/index.html) to using `bcftools` will help you understand how to extract and filter information from VCF files. The links under "Tips and Tricks" in the left-hand menu are especially useful.

### Index a VCF file

Before you work with a VCF file, you will probably want to index the file so that you can easily retrieve data from any part of the file without first decompressing the file (VCF files are often very large). To do this we will use a tool called `tabix`, which is included in the `htslib` package that you have already installed. Indexing a VCF file with tabix will create a second file with the extension `.vcf.gz.tbi`. You can index the VCF file you have already downloaded with the following command:

```shell
tabix CEU.exon.2010_03.genotypes.vcf.gz
```

Now that we have an indexed VCF file let's pull out all of the positions in the file in the chromosomal region `1:1105411-44137860` using the command:

```shell
tabix CEU.exon.2010_03.genotypes.vcf.gz 1:1105411-44137860
```

**Q1: How many positions are found in this region in the VCF file?**

Note that if you want to retain the VCF header when selection a chromosomal region with `tabix`, you will need to add the `-h` flag to your command.


### Get some preliminary statistics

Now that you have indexed your VCF file, lets use `bcftools` to get some statistics on the file. We can use `bcftools query` to print different fields from the VCF file. First, lets extract all of the different sample names that are included in our example VCF file. These names are all included in the header line, but it is much easier to extract them with `bcftools`:

```shell
bcftools query -l CEU.exon.2010_03.genotypes.vcf.gz 
```

**Q2: How many samples are included in the VCF file?**


To print the position of a variant (without the chromosome) we use the following command:

```shell
bcftools query -f '%POS\n' CEU.exon.2010_03.genotypes.vcf.gz
```

**Q3: How many positions are there total in the VCF file?**


If you want to extract multiple fields from the VCF file at once, you can include them all in your query command. For example, you can extract the chromosome, position, reference, and alternate alleles for each site in the VCF file using the following command:

```shell
bcftools query -f '%CHROM %POS %REF %ALT\n' CEU.exon.2010_03.genotypes.vcf.gz
```

Note that the file we are using does not contain allele frequency information as it only contains samples from one sequencing center and thus is a subset of a larger data set. However, it does contain allele counts, annotated as `AC`. We can use `bcftools filter` to select only positions with an allele count of one:

```shell
bcftools filter -i AC=1 CEU.exon.2010_03.genotypes.vcf.gz 
```

**Q4: How many positions are there with `AC=1`? Note that you cannot simply count lines since the output of `bcftools filter` includes the VCF header lines. You will need to use `bcftools query` to get this number.**

`bcftools` also has it's own function for gathering statistics on a file, including information about the transition to transversion ratio, singleton stats, allele frequency statistics, quality scores, indel distribution, substitution types, and depth distributions. Run `bcftools stats` on the sample VCF file and spend some time looking through the report. Note that not all sections area pplicable to this file.

**Q5: What is the ratio of transitions to transversions (ts/tv) in this file?**


### Altering a VCF file
Sometimes you may work with a tool that requires a different chromosome notation. Use the provided [map file](chr_name_conv.txt) to convert from number only chromosome notation to chromosomes with the prfix 'chr'. You can do this using the `bcftools annotate` function with the `--rename-chrs` flag. Save the converted VCF file as `CEU.exon.2010_03.genotypes.chr_conv.vcf.gz` and include it in your forked repository. Be sure to compress the file before saving it!


## Mutation Annotation Format (MAF) files
The Mutation Annotation Format, or MAF, is a tab-delimited text file format used to describe somatic DNA mutations. Be careful not to confuse it with Multiple Alignment Format files. Please start by reading more about the [MAF file specifications](https://docs.gdc.cancer.gov/Data/File_Formats/MAF_Format/). The files contained in a MAF file can vary so pay careful attention to the header column.

You will use the R package [`maftools`](https://bioconductor.org/packages/release/bioc/vignettes/maftools/inst/doc/maftools.html) to obtain and work with MAF files in this section of the module. Follow these [instructions](https://bioconductor.org/packages/release/bioc/vignettes/maftools/inst/doc/maftools.html#4_Installation) to install `maftools`.

### Read and summarize a MAF file
We will utilize an MAF file containing somatic variants from low grade glioma (LGG) samples generated as part of [The Cancer Genome Atlas Program (TCGA)](https://doi.org/10.1016/j.cels.2018.03.002) for this portion of the module. Use the following commands to load the MAF file into R:

```R
library(maftools)

# view available TCGA cohorts, check that LGG is there
tcgaAvailable()

# load the available LGG cohort
lgg <- tcgaLoad(study = "LGG")

# view a summary of this file
lgg
```

**Q6: What is the median number of variants per sample in this data set?**

### Generating plots with maftools

`maftools` has a number of built in functions to generate useful plots. Generate the following plots and send them to Henry to complete this training:
1. An oncoplot of the top five mutated genes
2. A boxplot of the transistion-to-transversion ratio
3. A plot comparing the mutation load in this LGG cohort to other TCGA cohorts. Use log scale.

## Wrap-up

To complete the project, commit and push your `answers.md` and the files containing your three plots to your fork. Then, let Henry know (and send him the link to your fork). He will check your answers and will certify completion of the skill assessment if everything is correct.
