# RNA-Seq Analysis

Pre-requisites: [R Programming](https://github.com/Bioinformatics-Research-Network/training-requirements/tree/main/R%20Programming), [R for Data Science](https://github.com/Bioinformatics-Research-Network/training-requirements/tree/main/R%20for%20Data%20Science)

## Overview

The purpose of this challenge is to complete a full differential gene expression analysis, generating the relevant figures and tables which should accompany it. It should be formatted in an aesthetic way that is easy to follow. 

### The data: Ewing sarcoma RNA-seq

Ewing sarcoma is a pediatric bone cancer which arises from the fusion of the EWSR1 and FLI1 genes ("EWSR1-FLI1" fusion oncogene).

Recently, some have proposed therapies for Ewing sarcoma which suppress EWSR1-FLI1. However, it is not clear yet how suppressing EWSR1-FLI1 impacts the transcriptomic state of Ewing sarcoma tumor cells.

You have been provided with a Ewing sarcoma RNA-seq data set (`EwS.rds`). The data is in `RangedSummarizedExperiment` format (read about this format [here](https://www.bioconductor.org/packages/devel/bioc/vignettes/SummarizedExperiment/inst/doc/SummarizedExperiment.html)). The metadata includes a column `condition` with two levels (1) `shEF1` (EWSR1-FLI1 knock-down) and (2) `shCTR` (control). There are 3 shCTR samples and 4 shEF1 samples.

```R
> rse <- readRDS("EwS.rds")
> rse$condition
[1] "shCTR" "shCTR" "shCTR" "shEF1" "shEF1" "shEF1" "shEF1"
```

Your task is to perform a differential gene expression (DGE) analysis to determine what genes, and biological pathways / processes, are altered in EWSR1-FLI1 knock-down (`shEF1`) vs control (`shCTR`).

## Requirements

To complete this task, you should perform the DGE analysis using [DESeq2](https://bioconductor.org/packages/release/bioc/html/DESeq2.html) and generate these tables and figures in an RMarkdown file (`.Rmd`):

1. PCA summarizing the sample-level variance within the data set.
2. MA Plot showing the relationship between mean count and log2 fold change.
3. Table listing the differentially-expressed genes (DEGs)
4. Volcano plot showing all DGE results.
5. Heatmap showing the top 10 over- and under-expressed DEGs.
6. Enrichment analysis showing the top over- and under-expressed KEGG pathways.
    - Create a figure & a table to summarize the results

Style and presentation requirements are the same as in [R for Data Science](https://github.com/Bioinformatics-Research-Network/training-requirements/tree/main/R%20for%20Data%20Science).

**Render your RMarkdown file (`.Rmd`) to HTML (`.html`) and commit/push both to your fork of the skill assessment repo. Once ready, send Henry the link to your fork.**


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

## Tips

### R Environment

Here are the R packages that are likely to be useful in completing this task:

1. [tidyverse](https://www.tidyverse.org/)
    - Includes [ggplot2](https://ggplot2.tidyverse.org/), [dplyr](https://dplyr.tidyverse.org/), [readr](https://readr.tidyverse.org/), etc.
2. [DESeq2](https://bioconductor.org/packages/release/bioc/html/DESeq2.html)
3. [EnhancedVolcano](https://bioconductor.org/packages/release/bioc/html/EnhancedVolcano.html)
4. [pheatmap](https://cran.r-project.org/web/packages/pheatmap/index.html)
5. [enrichR](https://cran.r-project.org/web/packages/enrichR/index.html)
6. [msigdbr](https://cran.r-project.org/web/packages/msigdbr/index.html)
7. [clusterProfiler](https://bioconductor.org/packages/release/bioc/html/clusterProfiler.html)

### Useful learning resources:

1. BIG Club’s RNA-Seq workshop (goes through all the required tasks in weeks 6-9): https://www.bigbioinformatics.org/r-and-rnaseq-analysis
2. Bioconductor RNA-Seq tutorial: https://bioconductor.org/packages/release/workflows/html/rnaseqGene.html
3. DataCamp RNA-Seq tutorial: https://learn.datacamp.com/courses/rna-seq-with-bioconductor-in-r

