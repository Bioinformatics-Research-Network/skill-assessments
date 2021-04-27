# Back-End Web Development

Pre-requisite: [`Python for Data Science/`](https://github.com/Bioinformatics-Research-Network/training-requirements/tree/main/Python%20for%20Data%20Science) and ["Linux for Bioinformatics/"](https://github.com/Bioinformatics-Research-Network/training-requirements/tree/main/Linux%20for%20Bioinformatics)

**Note** This miniproject is experimental -- if you find flaws or have other suggestions, let Henry know.

As bioinformatics becomes more central in the study of biology, it is important to develop user-friendly tools for biologists so that they can run analyses without needing to code. Excellent examples of this can be found in [gepia2](http://gepia2.cancer-pku.cn/#index), [enrichr](https://maayanlab.cloud/Enrichr/), and [cBioPortal](https://www.cbioportal.org/). While `R-shiny` and `plotly dash` are useful for quickly creating small web apps that can serve a modest number of users, more complicated and scalable applications will require a robust web framework.

In this miniproject, you are tasked with creating a REST API backend using `python` and the `flask` framework. I recommend using basic `flask` at first, and then building the API in `flask-restful` once you are more comfortable. The API must contain the following endpoints:

1. `<app_base_url>/api/gapminder`

This endpoint should accept GET requests and should return all the data from `gapminder_clean.csv` in JSON format. 

2. `<app_base_url>/api/country`

This endpoint should accept GET requests which specify parameters that match the columns of `gapminder_clean.csv`. The goal is to select the countries that meet the specified criteria and return them.

E.g., `<app_base_url>/api/country?year=1962&co2-gt=10&continent=north-america` (filter by CO2 > 10, continent is North America, and year is 1962) should return something like:

```
{'countries': ['Canada', 'United States']}
```

3. Extend the `<app_base_url>/api/gapminder` endpoint so that it has the same filtering capability as in the previous step (2). 

E.g., `<app_base_url>/api/gapminder?year=1962&co2-gt=10&continent=north-america` (filter by CO2 > 10, continent is North America, and year is 1962) should all the 1962 data for Canada and the United States in JSON format.

4. Package your `gapminder_clean.csv` dataset in an `sqlite` database. Change your API code so that all queries work with the `sqlite` database and the `.csv` file is no longer needed.

5. Deploy your application along with any necessary databases to AWS. You can use a free AWS EC2 instance to do this. See the instructions in the `Linux for Bioinformatics/` training. The only difference is that you will need to allow HTTP/HTTPS traffic while configuring your instance. You can find an example of this [here](https://www.twilio.com/blog/deploy-flask-python-app-aws). 

6. Set up [nginx](https://www.nginx.com/) on your EC2 instance and use it to serve your `flask` API. For a nice guide to setting this up, see [here](https://www.digitalocean.com/community/tutorials/how-to-serve-flask-applications-with-uswgi-and-nginx-on-ubuntu-18-04) and additional guidance [here](https://flask.palletsprojects.com/en/1.1.x/deploying/wsgi-standalone/#proxy-setups). **NOTE**: Keep in mind that you won't be able to access any ports on the remote machine unless they were opened during EC2 setup in the Security Group settings.

6. Create a [postman](https://www.postman.com/) account. Follow their [tutorials](https://learning.postman.com/docs/getting-started/introduction/) to learn how to use it.

7. Use postman to test and document your API. Documentation should be sufficient for someone else to fully utilize the API.

8. Share the API with Henry in postman.


## Resources for learning

This is a challenging task for those without web development experience. To get comfortable, it is recommended to first learn `flask` using their tutorial [here](https://flask.palletsprojects.com/en/1.1.x/tutorial/). It may also be useful to watch a comprehensive tutorial on `flask API`, like [this one](https://www.youtube.com/watch?v=GMppyAPbLYk).

`SQL` can also be challenging. There is an excellent course on it in [DataCamp](https://learn.datacamp.com/courses/introduction-to-sql). Postman is also difficult at first -- so it would be wise to watch a tutorial about it [here](https://www.youtube.com/watch?v=VywxIQ2ZXw4).



