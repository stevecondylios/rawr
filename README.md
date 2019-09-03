# Get Started Using rawr

Websites containing R code sometimes necessitate tedious copy/pasting of code blocks from the website to your code editor in order for you to be able to run the code for yourself.

`rawr` takes care of this with a single function call. 

## Simple Example: Extract R Code from Kaggle Notebook

To get the code from a kaggle notebook simply provide the url to `kaggle()`, like so:

```
library(rawr)
code <- kaggle("https://www.kaggle.com/vrtjso/mercari-eda-more-info-than-you-can-imagine")

# View code easily
cat(code)

``` 


## Another Example

[Here](https://www.tidytextmining.com/sentiment.html)'s a tutorial on sentiment analysis using `tidytext`. 

You can retrieve all the R code from the page with `rawr::tidytext(url)` like so

```R
library(rawr)
library(dplyr)

# Print R code to console
tidytext("https://www.tidytextmining.com/sentiment.html") %>% cat


# library(tidytext)
# 
# get_sentiments("afinn")
# get_sentiments("bing")
# get_sentiments("nrc")
# library(janeaustenr)
# library(dplyr)
# library(stringr)
# 
# tidy_books <- austen_books() %>%
#   group_by(book) %>%
#   mutate(linenumber = row_number(),
#
# etc..

```


`rawr` also works for datacamp, github, and kaggle.

```R

library(rawr)
library(dplyr)

datacamp("https://www.datacamp.com/community/tutorials/sentiment-analysis-R") %>% cat

github("https://github.com/hadley/vis-eda/blob/master/travel.R") %>% cat

kaggle("https://www.kaggle.com/vrtjso/mercari-eda-more-info-than-you-can-imagine") %>% cat

```


## Further Documentation and Examples

See:

```R
?rawr::datacamp
?rawr::github
?rawr::kaggle
?rawr::tidytext
```




# Issues and Feature Requests

If you're reporting an issue, please include:

* Example code that reproduces the **observed** behavior.
* An explanation of what the **expected** behavior is.
* A specific url you're attempting to retrieve R code from (if that's what your issue concerns)


If you're after a new feature, please raise an issue, including:

* Describing the functionality you're after
* Provide examples of the inputs and desired output

You could also consider making a pull request


## Pull Requests

Pull requests are welcomed. 

If you create a function to retrieve R code from another website, please ensure you

* Where possible, give the function the name of the website domain it works on (e.g. if the function retrives R code from `www.example.com`, the function should be named `rawr::example()`), unless there's some sensible reason to deviate.
* Please ensure the __intent__ of your contribution is clear.
* Please provide at least one example url






