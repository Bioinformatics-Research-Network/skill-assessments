# Python for Data Science

Pre-requisite: [`Python Programming/`](https://github.com/Bioinformatics-Research-Network/training-requirements/tree/main/Python%20Programming)

With its clean syntax, massive community, and extensive package ecosystem, python is an excellent language for Data Science. In particular, packages like `scikit-learn`, `pandas`, `numpy`, `matplotlib`, `seaborn`, `scipy`, `plotly`, and `bokeh` have an incredible array of functions for doing data science. Python is also the basis for the powerful `Anaconda` ecosystem, including `jupyter-notebook` and `spyder`. Furthermore, `RStudio`, a mainstay in `R` for Data Science, also now supports `Python` programming. 

In this training, you will perfom a comprehensive analysis of the `gapminder_clean.csv` dataset and present your results using `jupyter notebook` in `.html` format. 

To complete the miniproject, create an analysis in `jupyter-notebook` which does the following:

1. Read in the `gapminder_clean.csv` data as a `pandas` `DataFrame`.
2. Filter the data to include only rows where `Year` is `1962` and then make a scatter plot comparing `'CO2 emissions (metric tons per capita)'` and `gdpPercap` for the filtered data. 
3. On the filtered data, calculate the correlation of `'CO2 emissions (metric tons per capita)'` and `gdpPercap`. What is the correlation and associated p value?
4. On the unfiltered data, answer "In what year is the correlation between `'CO2 emissions (metric tons per capita)'` and `gdpPercap` the strongest?" Filter the dataset to that year for the next step...
5. Using `plotly` or `bokeh`, create an interactive scatter plot comparing `'CO2 emissions (metric tons per capita)'` and `gdpPercap`, where the point size is determined by `pop` (population) and the color is determined by the `continent`. 

Now, without further guidance, use your Python Data Science skills (and the correct statistical tests) to answer the following (*use the unfiltered dataset*):

1. What is the relationship between `continent` and `'Energy use (kg of oil equivalent per capita)'`? (Stats test needed)
2. Is there a significant difference between Europe and Asia with respect to `'Imports of goods and services (% of GDP)'` in the years after 1990? (Stats test needed)
3. What is the country (or countries) that has the highest `'Population density (people per sq. km of land area)'` across all years? (i.e., which country has the highest average ranking in this category across each time point in the dataset?)
4. What country (or countries) has shown the greatest increase in `'Life expectancy at birth, total (years)'` between 1962 and 2007? 

For each question, you should generate summary visualizations (preferrably interactive ones) that demonstrate your answer to each question. Additionally, the analysis must be user-friendly for a non-programmer and should intuitively convey the insights you uncovered. Use `markdown` to ensure that the text is organized and readable. Finally, the notbook should describe your reasoning for the statistical tests you chose to use.

Once you are done, push the notebook to GitHub, generate an `nbviewer` link [here](https://nbviewer.jupyter.org/) and share it with Henry.

## Learning Resources

The techniques you apply here can be learned from DataCamp courses in the "Data Scientist with Python" career track ([link](https://learn.datacamp.com/career-tracks/data-scientist-with-python)). It's recommended to take as many of these courses as needed. Everything up until "Supervised Learning with scikit-learn" is pretty directly relevant.

You can also learn most of these skills from the free [Python Data Science Handbook](https://jakevdp.github.io/PythonDataScienceHandbook/).

Flowchart for choosing statistical tests:
![img](https://cdn.scribbr.com/wp-content/uploads//2020/01/flowchart-for-choosing-a-statistical-test.png)


