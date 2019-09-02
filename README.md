# Get started using rawr

Websites containing R code sometimes necessitate tedious copy/pasting of code from website to your code editor.

`rawr` does this for you 


## Example

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


# Or store code as a string

code <- tidytext("https://www.tidytextmining.com/sentiment.html") 


```


`rawr` currently also works for datacamp, github, and kaggle.

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



# Issue and Pull Request Guidelines

Thank you for helping make rawr better!


## Issues

If you're reporting an issue, it must contain:

* Example code that reproduces the **observed** behavior.
* An explanation of what the **expected** behavior is.



## Pull Requests

Pull requests are welcomed. 

If you create a function to retrieve R code from another website, please follow these conventions

* The function should be named according the name of the website (e.g. if the function retrives R code from `www.example.com`, it should be named `rawr::example()`), unless there's sensible reason to deviate.
* Please ensure the __intent__ of your contribution is clear.






