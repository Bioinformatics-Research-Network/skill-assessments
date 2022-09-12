# RNA-Seq Analysis

Pre-requisites: [R Programming](https://github.com/Bioinformatics-Research-Network/training-requirements/tree/main/R%20Programming) and [R for Data Science](https://github.com/Bioinformatics-Research-Network/training-requirements/tree/main/R%20for%20Data%20Science)

## Instructions

The purpose of this challenge is to complete a full RNA-Seq analysis, including interpretation of the results in a biological context. You should pretend that you are making a report that you want to show to a biomedical collaborator who does not know bioinformatics. You should have an introduction in which you outline the research question, a results section in which you present your results, and a discussion section in which you interpret the results. It should be formatted in an aesthetic way that is easy to follow. 
Pre-requisite: [`R for Data Science/`](https://github.com/Bioinformatics-Research-Network/training-requirements/tree/main/R%20for%20Data%20Science)

Find an RNA-Seq dataset and perform differential gene expression analysis to determine the effect of some condition on gene expression. I would recommend finding a dataset from [recount2](https://jhubiostatistics.shinyapps.io/recount/), but you can also use [GEO](https://www.ncbi.nlm.nih.gov/geo/) as long as you are certain that you have obtained raw read count data and not normalized data. Additionally, your dataset must have at least 3 replicates in two or more biological conditions of interest (e.g., 3 cancer samples vs 3 normal samples). For example, `ERP010786` (in recount2) would be is a suitable study. To get the data for this study, simply download the read counts from recount2 (the `RSE_v2` file) -- this can be loaded into R with the `load()` command. The data will be loaded in a `RangedSummarizedExperiment` object -- see the resources below to learn how to use this for the analysis. 

**NOTE**: ERP010786 was an example, so you are required to choose a different dataset for your analysis. 

If you do not see the information about the biological conditions of the samples in your experiment, you can check SRA for that information. Here is the SRA page for ERP010786: https://www.ncbi.nlm.nih.gov/Traces/study/?acc=ERP010786

Then, do the following in R Markdown:
1. Use DESeq2 for the differential gene expression analysis. Find the DEGs between your conditions of interest.
	- Make sure to add an interactable table of DEGs using a package such as [DT](https://rstudio.github.io/DT/)
2. Create a PCA plot colored by the condition of interest
3. Create a Volcano Plot
4. Create a heatmap with the top 10 over-expressed DEGs, and top 10 under-expressed DEGs
	- Top is defined by DEGs having the lowest adjusted p-values
5. Do GSEA on the results and plot the top 5 pathways
	- For your ranking metric, use the `stat` column from your `DESeq2` results
	- Top is defined by pathways with the lowest adjusted p-values
6. Make sure to export your R Markdown to HTML and that it comes out looking correctly -- example of an HTML export of RMarkdown: https://static-html-pages.s3-us-west-2.amazonaws.com/merck-project/RloopCorrelationSummary.html
	- Also include a floating TOC, and foldable code snippets that are folded by default
7. What do the results tell you about your conditions of interest? What is the biological meaning of these results? What future experiments could you perform? (These questions don't have an exact right answer, just about thinking through the meaning of the results). 


### Additional requirements

For a passing evaluation, the code and HTML from this analysis should conform to the following standards:

1. When possible, the analysis should be "self-reporting" (i.e., results should not be hardcoded into the markdown.) You can accomplish this with inline code chunks -- learn more [here](https://rmarkdown.rstudio.com/lesson-4.html).
2. Code style counts. Make sure to style your notebook using [styler](https://www.tidyverse.org/blog/2017/12/styler-1.0.0/) before submitting it!
3. The HTML rendered from the notebook should be user-friendly and well-styled as well.
    - Consider using a [theme](https://bookdown.org/yihui/rmarkdown/html-document.html#appearance-and-style) for your notebook, along with a [table of contents](https://bookdown.org/yihui/rmarkdown/html-document.html#table-of-contents)
    - Optimize your plots for readability -- [tutorial](https://cedricscherer.netlify.app/2019/08/05/a-ggplot2-tutorial-for-beautiful-plotting-in-r/)
    - Refrain from showing raw text output to the reader as this is unfriendly for non-computational readers. Especially, for tables, consider using [kableExtra](https://cran.r-project.org/web/packages/kableExtra/vignettes/awesome_table_in_html.html) or [DT](https://rstudio.github.io/DT/).
4. All code should be in tidyverse style where appropriate (particularly for data wrangling, filtering, manipulation, etc). This is the same requirement as [R for Data Science](https://github.com/Bioinformatics-Research-Network/skill-assessments/tree/main/R%20for%20Data%20Science):

Instead of this:
```R
my_data <- my_data[which(my_data$col1 == 10 | my_data$col2 == "Yes"),]
my_data$new_col <- 10*my_data$col1
png("my_plot.png")
plot(my_data$col1, my_data$new_col)
title("some title")
dev.off()
```
Do this:
```R
my_data %>%
    filter(col1 == 10 | col2 == "Yes") %>%
    mutate(new_col = 10*col1) %>%
    ggplot2(aes(x = col1, y = new_col)) +
    geom_point() +
    labs(title="some title") +
    ggsave("my_plot.png")
```


### Useful learning resources:
1. BIG Club’s RNA-Seq workshop (goes through all the required tasks in weeks 6-9): https://www.bigbioinformatics.org/r-and-rnaseq-analysis
2. Bioconductor RNA-Seq tutorial: https://bioconductor.org/packages/release/workflows/html/rnaseqGene.html
3. DataCamp RNA-Seq tutorial: https://learn.datacamp.com/courses/rna-seq-with-bioconductor-in-r

