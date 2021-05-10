# ChIP-Seq Analysis

Suggested pre-requisite: [`R for Data Science/`](https://github.com/Bioinformatics-Research-Network/training-requirements/tree/main/R%20for%20Data%20Science)

ChIP-Seq is a technique for finding the sites that a protein binds to in the genome. It has a wide range of applications from mapping histone modifications to uncovering transcription factor gene targets. In this miniproject, your goal is to analyze two ChIP-Seq datasets and compare the results. This will require you to excercise your biological and informatics knowledge. The result will be an HTML report outlining the purpose of your analysis, the methods you used, your results, and your discussion / conclusion. It should be written in such a way that biologists who have no bioinformatics training can understand it.

Select any two ChIP-Seq datasets from [ENCODE](https://www.encodeproject.org/) – download the peaks for both, in ‘bed narrowPeak’ format. It doesn’t matter much what options you choose beyond that, though I typically prefer IDR thresholded peaks. For example, NFE2L2 ChIP-Seq ([data set](https://www.encodeproject.org/experiments/ENCSR584GHV/) -- [peaks](https://www.encodeproject.org/files/ENCFF418TUX/)) and BRCA1 ChIP-Seq ([dataset](https://www.encodeproject.org/experiments/ENCSR343RJR/) -- [peaks](https://www.encodeproject.org/files/ENCFF791SNR/)). But, since these are the examples, you cannot use either of them in your analysis. Once you have selected your datasets, do the following:

1. Make a venn diagram comparing the overlap of binding sites for your two ChIP-Seq datasets
2. Make a metaplot of your two datasets around the TSS.
3. Annotate the peaks for genomic features such as intron, exon, 3’UTR, etc and compare the annotations between your two datasets.
4. Assign peaks to genes – then perform pathway enrichment.
5. Present the results in notebook form (either `Rmarkdown` or `jupyter notebook`). Make sure to export your notebook to HTML and that it comes out looking correctly -- [here](https://static-html-pages.s3-us-west-2.amazonaws.com/merck-project/RloopCorrelationSummary.html) is an example of an HTML export of RMarkdown
6. What genes and pathways/genesets shared between these datasets? What pathways differ? What is your interpretation of these results? What future directions could you propose to follow up on these findings? (No right answers to these questions, just important to think through this part).


All code and `.html` should be commited using `git` and pushed to your fork of the training repo on GitHub. Once you are done, let Henry know and he will check your `.html` report. 

Useful resources for learning this analysis approach:
1. ChIP-Seq tutorial on `ChIPseeker` [here](https://www.bioconductor.org/packages/release/bioc/vignettes/ChIPseeker/inst/doc/ChIPseeker.html)
2. ChIP-Seq tutorial on `ChIPpeakAnno` [here](https://www.bioconductor.org/packages/release/bioc/html/ChIPpeakAnno.html)
3. HBC Training in ChIP-Seq [here](https://hbctraining.github.io/Intro-to-ChIPseq/schedule/2-day.html)

**Note**: Don't forget to make sure that the genome assembly for the annotations you use in `R` matches the genome assembly that your peaks use (this is listed on the data page in ENCODE). (Note that `hg38` is the same as `GRCh38`... and `hg38` is NOT the same as `hg19`). 

Bonus:

Where to find the peak file on Encode --

![Alt Text](https://media.giphy.com/media/aoV0nOJWRb7CSTQejM/giphy.gif)


