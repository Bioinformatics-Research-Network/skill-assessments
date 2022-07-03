# R for Data Science

Pre-requisites: [R Programming](https://github.com/Bioinformatics-Research-Network/training-requirements/tree/main/R%20Programming)
Pre-requisite: [`R Programming/`](https://github.com/Bioinformatics-Research-Network/training-requirements/tree/main/R%20Programming)

`R` is an excellent language for Data Science. Some might even argue that Data Science is what `R` is for! 

In this miniproject, your task is to analyze the `gapminder_clean.csv` dataset using `R` and the `tidyverse`. Wherever possible, your code should use `tidyverse` functions. For example:

Instead of this:
```
my_data <- my_data[which(my_data$col1 == 10 | my_data$col2 == "Yes"),]
my_data$new_col <- 10*my_data$col1
png("my_plot.png")
plot(my_data$col1, my_data$new_col)
title("some title")
dev.off()
```
Do this:
```
my_data %>%
    filter(col1 == 10 | col2 == "Yes") %>%
    mutate(new_col = 10*col1) %>%
    ggplot2(aes(x = col1, y = new_col)) +
    geom_point() +
    labs(title="some title") +
    ggsave("my_plot.png")
```

Complete the following analysis in `R` and generate an `RMarkdown` report to show the analysis and results:

1. Read in the `gapminder_clean.csv` data as a `tibble` using `read_csv`.
2. Filter the data to include only rows where `Year` is `1962` and then make a scatter plot comparing `'CO2 emissions (metric tons per capita)'` and `gdpPercap` for the filtered data. 
3. On the filtered data, calculate the correlation of `'CO2 emissions (metric tons per capita)'` and `gdpPercap`. What is the correlation and associated p value?
4. On the unfiltered data, answer "In what year is the correlation between `'CO2 emissions (metric tons per capita)'` and `gdpPercap` the strongest?" Filter the dataset to that year for the next step...
5. Using `plotly`, create an interactive scatter plot comparing `'CO2 emissions (metric tons per capita)'` and `gdpPercap`, where the point size is determined by `pop` (population) and the color is determined by the `continent`. You can easily convert any `ggplot` plot to a `plotly` plot using the `ggplotly()` command.

Now, without further guidance, use your `R` Data Science skills (and appropriate statistical tests) to answer the following:

1. What is the relationship between `continent` and `'Energy use (kg of oil equivalent per capita)'`? (stats test needed)
2. Is there a significant difference between Europe and Asia with respect to `'Imports of goods and services (% of GDP)'` in the years after 1990? (stats test needed)
3. What is the country (or countries) that has the highest `'Population density (people per sq. km of land area)'` across all years? (i.e., which country has the highest average ranking in this category across each time point in the dataset?)
4. What country (or countries) has shown the greatest increase in `'Life expectancy at birth, total (years)'` since 1962? 

For each question, you should generate summary visualizations (preferrably interactive ones) that demonstrate your answer to each question. Additionally, the analysis must be user-friendly for a non-programmer and should intuitively convey the insights you uncovered. Use `markdown` to ensure that the text is organized and readable. 

Once you are done, export your `RMarkdown` to an `.html` file and share it with Henry.

### Additional requirements

For a passing evaluation, the code and HTML from this analysis should conform to the following standards:

1. When possible, the analysis should be "self-reporting" (i.e., results should not be hardcoded into the markdown.) You can accomplish this with inline code chunks -- learn more [here](https://rmarkdown.rstudio.com/lesson-4.html).
2. Code style counts. Make sure to style your notebook using [styler](https://www.tidyverse.org/blog/2017/12/styler-1.0.0/) before submitting it!
3. The HTML rendered from the notebook should be user-friendly and well-styled as well.
    - Consider using a [theme](https://bookdown.org/yihui/rmarkdown/html-document.html#appearance-and-style) for your notebook, along with a [table of contents](https://bookdown.org/yihui/rmarkdown/html-document.html#table-of-contents)
    - Optimize your plots for readability -- [tutorial](https://cedricscherer.netlify.app/2019/08/05/a-ggplot2-tutorial-for-beautiful-plotting-in-r/)
    - Refrain from showing raw text output to the reader as this is unfriendly for non-computational readers. Especially, for tables, consider using [kableExtra](https://cran.r-project.org/web/packages/kableExtra/vignettes/awesome_table_in_html.html) or [DT](https://rstudio.github.io/DT/).

## Learning Resources

The techniques you apply here can be learned from DataCamp courses in the "Data Scientist with R" career track ([link](https://learn.datacamp.com/career-tracks/data-scientist-with-r)). It's recommended to take as many of these courses as needed. Everything up until "Supervised Learning in R: Classification" is pretty directly relevant.

You can also learn most of these skills from the free book, [R for Data Science](https://r4ds.had.co.nz/).

Suggested by Roshan, Introduction to Data Science book [here](https://rafalab.github.io/dsbook/models.html).

![img](https://cdn.scribbr.com/wp-content/uploads//2020/01/flowchart-for-choosing-a-statistical-test.png)
