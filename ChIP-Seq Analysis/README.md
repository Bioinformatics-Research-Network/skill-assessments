# Miniproject: ChIP-Seq Analysis

Programming language: **R**

Select two ChIP-Seq datasets from ENCODE – download the peaks for both, in ‘bed narrowPeak’ format. It doesn’t matter much what options you choose beyond that, though I typically prefer IDR thresholded peaks. For example, you could select NFE2L2 ChIP-Seq (data set: https://www.encodeproject.org/experiments/ENCSR584GHV/ -- peaks: https://www.encodeproject.org/files/ENCFF418TUX/) and BRCA1 (dataset: https://www.encodeproject.org/experiments/ENCSR343RJR/ -- peaks: https://www.encodeproject.org/files/ENCFF791SNR/). Do the following analyses (using a tool like ChIPSeeker):

1. Make a venn diagram comparing the overlap of binding sites for your two ChIP-Seq datasets
2. Make a metaplot of your two datasets around the TSS. (This is the `plotAvgProf()` function in `ChIPSeeker`, for reference)
3. Annotate the peaks for genomic features such as intron, exon, 3’UTR, etc and compare the annotations between your two datasets.
4. Assign peaks to genes – then perform pathway enrichment.
5. Present the results in notebook form (either Rmarkdown or jupyter notebook).
6. What pathways are shared between these datasets? What pathways differ? What is your interpretation of these results? What future directions could you propose to follow up on these findings? (No right answers to these questions, just important to think through this part).

Useful resources for learning this analysis approach:
ChIP-Seq tutorial on ChIPseeker: https://www.bioconductor.org/packages/release/bioc/vignettes/ChIPseeker/inst/doc/ChIPseeker.html
ChIP-Seq tutorial on ChIPpeakAnno: https://www.bioconductor.org/packages/release/bioc/html/ChIPpeakAnno.html


