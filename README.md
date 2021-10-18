
# rawr <a href='https://github.com/stevecondylios/rawr'><img src='man/figures/rawr.png' align="right" height="139" /></a>

[![CRAN
status](https://www.r-pkg.org/badges/version/rawr)](https://cran.r-project.org/package=rawr)
[![Travis build
status](https://travis-ci.org/stevecondylios/rawr.svg?branch=master)](https://travis-ci.org/stevecondylios/rawr)
<!-- badges: end -->

`rawr` helps you quickly grab R code from the web, either straight to an
R file, or to your clipboard. This avoids tedious copy/pasting of code
from browser to IDE.

### R Code from Popular R websites

Retrieve R code from a website to your clipboard with `rawr_to_clip()`,
here are some examples:

``` r
# install.packages("rawr")
library(rawr)

# CRAN vignettes
rawr_to_clip("https://cran.r-project.org/web/packages/tidytext/vignettes/tidytext.html")

# Stack Overflow
rawr_to_clip("https://stackoverflow.com/questions/58248102/date-input-dt-r-shiny")

# Kaggle
rawr_to_clip("https://www.kaggle.com/vrtjso/mercari-eda-more-info-than-you-can-imagine")

# GitHub 
rawr_to_clip("https://github.com/hadley/vis-eda/blob/master/travel.R")

# Jupyter Notebook on GitHub
rawr_to_clip("https://github.com/tulip-lab/sit742/blob/master/Jupyter/SIT742P10B-MLSystem.ipynb")

# Blogdown sites
rawr_to_clip("https://www.jtimm.net/2019/04/14/lexical-change-procrustes/")
```

### Other functionality

Write output to a temp file

``` r
rawr("https://www.kaggle.com/vrtjso/mercari-eda-more-info-than-you-can-imagine", to_file=T)
```

Write output to a specific file

``` r
rawr("https://www.kaggle.com/vrtjso/mercari-eda-more-info-than-you-can-imagine", file_path="mynewfile.R")
```

# Issues and Feature Requests

When reporting an issue, please include:

-   Example code that reproduces the **observed** behavior.
-   An explanation of what the **expected** behavior is.
-   A specific url you’re attempting to retrieve R code from (if that’s
    what your issue concerns)

For feature requests, raise an issue with the following:

-   The desired functionality
-   Example inputs and desired output

# Pull Requests

Pull requests are welcomed. Before doing so, please create an issue or
email me with your idea.

Any new functions should follow the conventions established by the the
package’s existing functions. Please ensure

-   Functions are sensibly named
-   The **intent** of the contribution is clear
-   At least one example is provided in the documentation
