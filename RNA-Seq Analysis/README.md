# Miniproject: RNA-Seq Analysis

Programming langauge: **R**

Select a study from recount2 (with at least 3 replicates in two biological conditions of interest) and perform differential gene expression analysis. https://jhubiostatistics.shinyapps.io/recount/ -- for example, ERP010786 is a suitable study. In this study, there are 3 uninfected and 3 infected samples -- differential gene expression analysis would attempt to find what genes are differentially expressed in infected vs uninfected samples. To get the data, simply download the read counts for that study (the `RSE_v2` file) -- this can be loaded into R with the `load()` command. The data will be loaded in a `RangedSummarizedExperiment` object -- see the resources below to learn how to use this for the analysis.

**NOTE**: Recount2 has been having some technical issues lately... if it isn't working, go ahead and use the ERP010786.rda file included in this repo.  

If you do not see the information about the biological conditions of the samples in your experiment, you can check SRA for that information. Here is the SRA page for ERP010786: https://www.ncbi.nlm.nih.gov/Traces/study/?acc=ERP010786

Then, do the following:
1. Use DESeq2 for the differential gene expression analysis. Find the DEGs between your conditions of interest. 
2. Create a PCA plot colored by the condition of interest
3. Create a Volcano Plot
4. Create a heatmap showing the top 20 over- and under-expressed DEGs
5. Do GSEA on the results and plot the top 5 pathways
6. Present the results in notebook form (either Rmarkdown or jupyter notebook).
7. What do the results tell you about your conditions of interest? What is the biological meaning of these results? What future experiments could you perform? (These questions don't have an exact right answer, just about thinking through the meaning of the results). 

Useful resources for learning this analysis approach:
1. BIG Club’s RNA-Seq workshop (goes through all the required tasks in weeks 6-9): https://uthscsa.box.com/s/bq936da9strq5u8g42y8sc9ppj3mq1jt
2. Bioconductor RNA-Seq tutorial: https://bioconductor.org/packages/release/workflows/html/rnaseqGene.html
3. DataCamp RNA-Seq tutorial: https://learn.datacamp.com/courses/rna-seq-with-bioconductor-in-r

