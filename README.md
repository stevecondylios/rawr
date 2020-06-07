
# rawr <a href='https://github.com/stevecondylios/rawr'><img src='man/figures/rawr.png' align="right" height="139" /></a>

[![CRAN
status](https://www.r-pkg.org/badges/version/rawr)](https://cran.r-project.org/package=rawr)
[![Travis build
status](https://travis-ci.org/stevecondylios/rawr.svg?branch=master)](https://travis-ci.org/stevecondylios/rawr)
<!-- badges: end -->

Websites containing R code sometimes necessitate tedious copy/pasting of
code blocks from the website to your code editor in order for you to be
able to run the code for yourself.

`rawr` takes care of this.

### Get R Code from Popular R websites

To get the code from a website to your clipboard, use `rawr_to_clip()`,
like in these examples:

``` r
# install.packages("rawr")
library(rawr)

# CRAN vignettes
rawr_to_clip("https://cran.r-project.org/web/packages/tidytext/vignettes/topic_modeling.html")

# Stack Overflow
rawr_to_clip("https://stackoverflow.com/questions/58248102/date-input-dt-r-shiny")

# Kaggle
rawr_to_clip("https://www.kaggle.com/vrtjso/mercari-eda-more-info-than-you-can-imagine")

# Datacamp
rawr_to_clip("https://www.datacamp.com/community/tutorials/sentiment-analysis-R")

# Github 
rawr_to_clip("https://github.com/hadley/vis-eda/blob/master/travel.R")

# Blogdown sites
rawr_to_clip("https://www.jtimm.net/2019/04/14/lexical-change-procrustes/")
```

### More Examples

`rawr` currently supports github, kaggle, datacamp, and many blogdown
sites. Try it

``` r
library(rawr)
library(dplyr)

rawr("https://www.datacamp.com/community/tutorials/sentiment-analysis-R") %>% cat
rawr("https://github.com/hadley/vis-eda/blob/master/travel.R") %>% cat
rawr("https://www.kaggle.com/vrtjso/mercari-eda-more-info-than-you-can-imagine") %>% cat
rawr("https://www.jtimm.net/2019/04/14/lexical-change-procrustes/") %>% cat
```

### Other use

Write output to a temp file

``` r
rawr("https://www.kaggle.com/vrtjso/mercari-eda-more-info-than-you-can-imagine", to_file=T)
```

Write output to a specific file

``` r
rawr("https://www.kaggle.com/vrtjso/mercari-eda-more-info-than-you-can-imagine", file_path="mynewfile.R")
```

Some sites have \> 1 way of identifying R coode. If `rawr()` returns no
result (or if the result is non-sense), try another `method`

``` r
"https://www.datacamp.com/community/tutorials/keras-r-deep-learning" %>% rawr %>% cat
# no result

"https://www.datacamp.com/community/tutorials/keras-r-deep-learning" %>% rawr(method = 2) %>% cat 
# returns correct output
```

# Issues and Feature Requests

When reporting an issue, please include:

  - Example code that reproduces the **observed** behavior.
  - An explanation of what the **expected** behavior is.
  - A specific url you’re attempting to retrieve R code from (if that’s
    what your issue concerns)

For feature requests, raise an issue with the following:

  - The desired functionality
  - Example inputs and desired output

# Pull Requests

Pull requests are welcomed. Before doing so, please create an issue or
email me with your idea.

Any new functions should follow the conventions established by the the
package’s existing functions. Please ensure

  - Functions are sensibly named
  - The **intent** of the contribution is clear
  - At least one example is provided in the documentation
