# Single-Cell RNA-Seq Analysis

**NOTE**: This assessment can be completed in R (using [Seurat](https://satijalab.org/seurat/)) or python (using [scanpy](https://scanpy.readthedocs.io/)).

Pre-requisites (for R): [R Programming](https://github.com/Bioinformatics-Research-Network/training-requirements/tree/main/R%20Programming), [R for Data Science](https://github.com/Bioinformatics-Research-Network/training-requirements/tree/main/R%20for%20Data%20Science)

Pre-requisites (for python): [Python Programming](https://github.com/Bioinformatics-Research-Network/training-requirements/tree/main/Python%20Programming), [Python for Data Science](https://github.com/Bioinformatics-Research-Network/training-requirements/tree/main/Python%20for%20Data%20Science)

The purpose of this challenge is to complete a full scRNA-Seq analysis, including interpreting the results in a biological context. You should pretend that you are making a report that you want to show to a biomedical collaborator who does not know any bioinformatics. You should have an introduction in which you outline the research question, a results section in which you present your results, and a discussion section in which you interpret the results. It should be written in RMarkdown (for R) or Jupyter Notebook (for Python) and formatted in an aesthetic way that is easy to follow. Here is an example of an aesthetic, easy-to-follow RMarkdown notebook: [here](https://static-html-pages.s3-us-west-2.amazonaws.com/merck-project/RloopCorrelationSummary.html). For Jupyter Notebook, just do your best to make it easy to read / follow.

## The Challenge

### Select a dataset

To complete this challenge you must **select an scRNA-Seq dataset** from any source. Pick one that you have a particular biological interest in. For example, I would pick [this dataset](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE118389) from GEO if my goal was to uncover rare cell subtypes in triple-negative breast tumors (you are not permitted to pick that one though).

The easiest way to find a dataset is to use the cellxgene browser [here](https://cellxgene.cziscience.com/datasets). You can also find data from the 10X genomics data repository [here](https://www.10xgenomics.com/resources/datasets?query=&page=1&configure%5Bfacets%5D%5B0%5D=chemistryVersionAndThroughput&configure%5Bfacets%5D%5B1%5D=pipeline.version&configure%5BhitsPerPage%5D=500). Finally, you can find datasets from [GEO](https://www.ncbi.nlm.nih.gov/gds) but be careful to make sure that the data is in the format you expect.

### Outline the background and analysis goals

Write a relatively brief (4-6 sentence typically) introduction to the analysis in which you address the following:

1. What is the dataset you chose to use? What tissues/samples is it from?
2. What specific questions do you plan to answer from the analysis?

### Perform the analysis

In general any analysis should include the following:

1. Data wrangling
2. Data quality control and filtering
3. Data normalization and scaling
4. Data integration (if determined necessary)
5. Dimensionality reduction
6. Embedding
7. Clustering
8. Cell type identification (if not already known)
9. Cluster marker analysis and pathway analysis

Any work which you perform in addition to the above is up to you -- the only requirement is that your analysis addresses your biological questions. Additionally, there's no penalty for finding negative results (results that do not support your hypothesis), and you are always encouraged to report these transparently.

### Discuss the results

Finally, write a brief discussion of the results of your analysis. You should reference your specific findings and discuss how they address your original biological questions.


### Additional requirements

For a passing evaluation, the code and HTML from this analysis should conform to the following standards:

1. When possible, the analysis should be "self-reporting" (i.e., results should not be hardcoded into the markdown in your report.) For RMarkdown, you can accomplish this with inline code chunks -- learn more [here](https://rmarkdown.rstudio.com/lesson-4.html). For Jupyter Notebooks, you can accomplish this by having code blocks print results as their output.
2. Code style counts. You can automatically style your RMarkdown notebook using [styler](https://www.tidyverse.org/blog/2017/12/styler-1.0.0/) or your Jupyter Notebook using [black](https://black.readthedocs.io/en/stable/getting_started.html) before submitting it!
3. The notebook should be user-friendly and well-styled as well.
    - (**RMarkdown only**) Consider using a [theme](https://bookdown.org/yihui/rmarkdown/html-document.html#appearance-and-style) for your notebook, along with a [table of contents](https://bookdown.org/yihui/rmarkdown/html-document.html#table-of-contents)
    - Optimize your plots for readability -- it should be obvious to the reader what each plot is trying to convey.
    - Refrain from showing raw text / warning message output to the reader when possible as this is unfriendly for non-computational readers. For R, consider using [kableExtra](https://cran.r-project.org/web/packages/kableExtra/vignettes/awesome_table_in_html.html) or [DT](https://rstudio.github.io/DT/) to make your tables.


## Resources and advice

Single-cell RNA-Seq is conceptually challenging and there is still much debate on how to approach analyzing this kind of data. Here are a few resources that will help you learn how to perform scRNA-Seq analysis:

R resources:

1. BIG Bioinformatics scRNA-Seq workshop (Spring 2021): [here](https://www.bigbioinformatics.org/intro-to-scrnaseq)
2. Harvard bioinformatics training on scRNA-Seq: [here](https://hbctraining.github.io/scRNA-seq_online/schedule/links-to-lessons.html)
3. Bioconductor scRNA-Seq guide: [here](http://bioconductor.org/books/release/OSCA/)
4. Broad Institute scRNA-Seq video lessons: [here](https://liulab-dfci.github.io/bioinfo-combio/scrna1.html)

Python resources:

1. CZI official tutorial: [here](https://chanzuckerberg.github.io/scRNA-python-workshop/intro/about.html)
2. Scanpy official tutorials: [here](https://scanpy.readthedocs.io/en/stable/tutorials.html)
3. Scanpy youtube tutorial: [here](https://www.youtube.com/watch?v=5HuOGZEu2HY)
4. Info on doing pathway enrichment for python: [here](https://discourse.scverse.org/t/pathway-analysis/806)

Finally, scRNA-Seq is more computationally intensive than many other bioinformatics approaches. If you find that your personal computer is not sufficient for performing the analysis, consider downsampling your data (randomly select a subset of cells to analyze). This will allow you to achieve a more shallow analysis without overwhelming your computer's resources. If this isn't sufficient, let Henry know and he can assist you.  



