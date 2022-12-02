# Working with Genomic Variant Files

Pre-requisites: [Linux for Bioinformatics](https://github.com/Bioinformatics-Research-Network/skill-assessments/tree/main/Linux%20for%20Bioinformatics)

## Instructions

The purpose of this challenge is to understand and utilize some of the most common filetypes generated from genomic data: [VCF](https://github.com/samtools/hts-specs/blob/master/VCFv4.3.pdf) and [MAF](https://docs.gdc.cancer.gov/Data/File_Formats/MAF_Format/). The purpose of this challenge is to learn to interpret variant calls when presented in these formats and to manipulate these file types. Wherever you are asked to answer a question, answer it in a separate markdown file called `answers.md`. You will need to send your answers to Henry in order to complete this training.

For example, if I asked:

    Q1. What are the different line types and how are they designaged in a VCF file?

This would be what I expect to see in answers.md:

    Q1: What are the different line types and how are they designaged in a VCF file?
    A: VCF files contain meta-information lines prefixed with '##', a header line prefixed with '#', and data lines each containing information about a position in the genome and genotype information on samples for each position (with the text fields separated by tabs).

See an example in answer_example.md within this directory.


## VCF files

After reading about the VCF file format at the link above, we recommend spending some time looking through a VCF file to understand the various fields. In this module we will utilize a VCF file generated as part of the 1000 Genomes Project pilot analyses that can be obtained from this ftp site: `http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/pilot_data/release/2010_07/exon/snps/CEU.exon.2010_03.genotypes.vcf.gz`. Go ahead and download this file using `wget` or `curl` and spend some time looking through it.

Due to their unique formatting, we recommend using tools specifically designed to work with genomic variant files instead of `sed/awk` or other default Linux commands. For this tutorial, we will use `tabix`, which is included in the [htslib](https://github.com/samtools/htslib) package and [bcftools](https://github.com/samtools/bcftools) to manipulate our VCF file. Go ahead and install these tools either from the linked repositories or by following [these](http://www.htslib.org/download/) instructions.


### Index a VCF file

Before you work with a VCF file, you will probably want to index the file so that you can easily retrieve data from any part of the file without first decompressing the file (VCF files are often very large). To do this we will use a tool called `tabix`, which is included in the `htslib` package that you have already installed. Indexing a VCF file with tabix will create a second file with the extension `.vcf.gz.tbi`. You can index the VCF file you have already downloaded with the following command:
>tabix CEU.exon.2010_03.genotypes.vcf.gz

Now that we have an indexed VCF file let's pull out all of the positions in the file in the chromosomal region `1:1105411-44137860` using the command
>tabix CEU.exon.2010_03.genotypes.vcf.gz 1:1105411-44137860

**Q1: How many positions are found in this region in the VCF file?**

Note that if you want to retain the VCF header when selection a chromosomal region with tabix, you will need to add the `-h` flag to your command.


### Get some preliminary statistics

Now that you have indexed your VCF file, lets use `bcftools` to get some statistics on the file. We can use `bcftools query` to print different fields from the VCF file. First, lets extract all of the different sample names that are included in our example VCF file. These names are all included in the header line, but it is much easier to extract them with `bcftools`:
>bcftools query -l CEU.exon.2010_03.genotypes.vcf.gz 

**Q2: How many samples are included in the VCF file?**


To print the position of a varaint (without the chromosome) we use the following command:
>bcftools query -f '%POS\n' CEU.exon.2010_03.genotypes.vcf.gz

**Q3: How many positions are there total in the VCF file?**


If you want to extract multiple fields from the VCF file at once, you can include them all in your query command. For example, you can extract the chromosome, position, reference, and alternate alleles for each site in the VCF file using the following command:
>bcftools query -f '%CHROM %POS %REF %ALT\n' CEU.exon.2010_03.genotypes.vcf.gz

Note that the file we are using does not contain allele frequency information as it only contains samples from one sequencing center and thus is a subset of a larger data set. However, it does contain allele counts, annotated as `AC`. We can use `bcftools filter` to select only positions with an allele count of one:
>bcftools filter -i AC=1 CEU.exon.2010_03.genotypes.vcf.gz 

**Q4: How many positions are there with AC=1. Note that you cannot simply count lines since the output of `bcftools filter ` includdes the VCF header lines. You will need to use `bcftools query` to get this number**





