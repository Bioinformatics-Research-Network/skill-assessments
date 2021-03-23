# Front-End Web Development

**Note** This miniproject is experimental -- if you find flaws or have other suggestions, let Henry know.

As bioinformatics becomes more central in the study of biology, it is important to develop user-friendly tools for biologists so that they can run bioinformatics analyses without needing to learn a programming language. Excellent examples of this can be found in [gepia2](http://gepia2.cancer-pku.cn/#index), [enrichr](https://maayanlab.cloud/Enrichr/), and [cBioPortal](https://www.cbioportal.org/). While `R-shiny` and `plotly dash` are useful for quickly creating small web apps that can serve a modest number of users, more complicated and scalable applications will require a robust web framework.

In this miniproject, you are tasked with creating a web application based on `react.js` which can recapitulate the following charts as closely as possible:

1. GapMinder Bubble Chart ([link](https://www.gapminder.org/tools/#$chart-type=bubbles))
2. GapMinder Line Chart ([link](https://tools-v1.gapminder.org/tools/#$ui$dialogs$moreoptions$opened:true;;;&chart-type=linechart&url=v1)) 

Then, place links to these charts within a user-friendly home page so that the following workflow is respected:

User visits home page --> User selects either the bubble chart or line chart using links --> user is redirected to the chart they selected --> User interacts with that chart --> User can press another link to return to the home page at any time.

The data needed to complete this challenge `gapminder_clean.csv` is provided here. There may be some values missing, let Henry know if you are missing too much data to complete this.

Web development / design is a key part of communicating science, and it is expected that all completed miniprojects will have the functionality noted above and offer a straightforward, user-friendly interface.


You can learn basic web development from a variety of free tutorials, such as W3 schools ([link](https://www.w3schools.com/)). An excellent `react.js` course is found [here](https://www.udemy.com/course/react-the-complete-guide-incl-redux/learn/lecture/8268490?start=15#overview) -- and [here](https://reactjs.org/tutorial/tutorial.html) is a free tutorial.

