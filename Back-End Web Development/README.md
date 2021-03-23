# Back-End Web Development

**Note** This miniproject is experimental -- if you find flaws or have other suggestions, let Henry know.

As bioinformatics becomes more central in the study of biology, it is important to develop user-friendly tools for biologists so that they can run bioinformatics analyses without needing to learn a programming language. Excellent examples of this can be found in [gepia2](http://gepia2.cancer-pku.cn/#index), [enrichr](https://maayanlab.cloud/Enrichr/), and [cBioPortal](https://www.cbioportal.org/). While `R-shiny` and `plotly dash` are useful for quickly creating small web apps that can serve a modest number of users, more complicated and scalable applications will require a robust web framework.

In this miniproject, you are tasked with creating a REST API backend using `python` and the `flask` framework. I recommend using basic `flask` at first, and then building the API in `flask-restful` once you are more comfortable. The API must contain the following endpoints:

1. `<app_base_url>/api/id2symbol`

This endpoint should accept `GET` requests containing Ensembl gene IDs. It should return the gene symbol(s) which match that ID based on `gene_id_to_symbol.csv`. **NOTE** The data should be in an SQL database.

E.g., `<app_base_url>/api/id2symbol?id=ENSG00000012048` should return something like:

```
{'id': 'ENSG00000012048', 'symbol': 'BRCA1'}
```

2. `<app_base_url>/api/corr`

This endpoint should accept GET requests containing two gene symbols and a correlation method (`spearman` or `pearson`). It should then calculate the correlation of these two genes using the dataset in `normalized_data.csv` and the correlation method specified. The returned JSON should include the R (as in "Pearson's R") value and the p value. 

E.g., `<app_base_url>/api/corr?genes=BRCA1+NFE2L2` should return something like:

```
{'geneOne': 'BRCA1', 'geneTwo': 'NFE2L2', 'r': 0.32, 'pval': 0.024}
```

3. `<app_base_url>/api/country`

This endpoint should accept GET requests which specify parameters that match the columns of `gapminder_clean.csv`. The goal is to select the countries that meet the specified criteria and return 




**NOTE**: Queries for tabular data (e.g., the data in `gene_id_to_symbol.csv`) should utilize an `SQL` database. Queries for non-tabular data (e.g., User profile information), should use a `NoSQL` database.




The data needed to complete this challenge `gapminder_clean.csv` is provided here. There may be some values missing, let Henry know if you are missing too much data to complete this.

Web development / design is a key part of communicating science, and it is expected that all completed miniprojects will have the functionality noted above and offer a straightforward, user-friendly interface.


You can learn basic web development from a variety of free tutorials, such as W3 schools ([link](https://www.w3schools.com/)). An excellent `react.js` course is found [here](https://www.udemy.com/course/react-the-complete-guide-incl-redux/learn/lecture/8268490?start=15#overview) -- and [here](https://reactjs.org/tutorial/tutorial.html) is a free tutorial.

