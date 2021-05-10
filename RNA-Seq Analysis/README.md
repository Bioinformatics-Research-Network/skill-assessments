# RNA-Seq Analysis

Suggested pre-requisites: [R Programming](https://github.com/Bioinformatics-Research-Network/training-requirements/tree/main/R%20Programming) and [R for Data Science](https://github.com/Bioinformatics-Research-Network/training-requirements/tree/main/R%20for%20Data%20Science)

The purpose of this challenge is to complete a full RNA-Seq analysis, including interpretation of the results in a biological context. You should pretend that you are making a report that you want to show to a biomedical collaborator who does not know bioinformatics. You should have an introduction in which you outline the research question, a results section in which you present your results, and a discussion section in which you interpret the results. It should be formatted in an aesthetic way that is easy to follow. 

Find an RNA-Seq dataset and perform differential gene expression analysis to determine the effect of some condition on gene expression. I would recommend finding a dataset from [recount2](https://jhubiostatistics.shinyapps.io/recount/), but you can also use [GEO](https://www.ncbi.nlm.nih.gov/geo/) as long as you are certain that you have obtained raw read count data and not normalized data. Additionally, your dataset must have at least 3 replicates in two or more biological conditions of interest (e.g., 3 cancer samples vs 3 normal samples). For example, `ERP010786` (in recount2) would be is a suitable study. To get the data for this study, simply download the read counts from recount2 (the `RSE_v2` file) -- this can be loaded into R with the `load()` command. The data will be loaded in a `RangedSummarizedExperiment` object -- see the resources below to learn how to use this for the analysis. 

**NOTE**: ERP010786 was an example, so you are required to choose a different dataset for your analysis. 

**NOTE 2**: If you do not see the information about the biological conditions of the samples in your experiment in Recount2, you can check SRA for that information. Here is the SRA page for ERP010786: https://www.ncbi.nlm.nih.gov/Traces/study/?acc=ERP010786

Then, do the following:
1. Use DESeq2 for the differential gene expression analysis. Find the DEGs between your conditions of interest. 
2. Create a PCA plot colored by the condition of interest
3. Create a Volcano Plot
4. Create a heatmap showing the top 20 over- and under-expressed DEGs
5. Do GSEA on the results and plot the top 5 pathways
6. Present the results in notebook form (either Rmarkdown or jupyter notebook). Make sure to export your notebook to HTML and that it comes out looking correctly -- example of an HTML export of RMarkdown: https://static-html-pages.s3-us-west-2.amazonaws.com/merck-project/RloopCorrelationSummary.html
7. What do the results tell you about your conditions of interest? What is the biological meaning of these results? What future experiments could you perform? (These questions don't have an exact right answer, just about thinking through the meaning of the results). 

All code and `.html` should be commited using `git` and pushed to your fork of the training repo on GitHub. Once you are done, let Henry know and he will check your `.html` report. 

Useful resources for learning this analysis approach:
1. BIG Club’s RNA-Seq workshop (goes through all the required tasks in weeks 6-9): https://www.bigbioinformatics.org/r-and-rnaseq-analysis
2. Bioconductor RNA-Seq tutorial: https://bioconductor.org/packages/release/workflows/html/rnaseqGene.html
3. DataCamp RNA-Seq tutorial: https://learn.datacamp.com/courses/rna-seq-with-bioconductor-in-r

