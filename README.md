# Get Started Using rawr

Websites containing R code sometimes necessitate tedious copy/pasting of code blocks from the website to your code editor in order for you to be able to run the code for yourself.

`rawr` takes care of this.  

### Simple Example: Get R Code from a Kaggle Notebook

To get the code from a kaggle notebook:

```R
library(rawr)
code <- rawr("https://www.kaggle.com/vrtjso/mercari-eda-more-info-than-you-can-imagine")

# View code easily
cat(code)
``` 


### More Examples

[Here](https://www.tidytextmining.com/sentiment.html)'s a great tutorial. 

What if you want to run the R code yourself? Easy!

```R
library(rawr)

code <- rawr("https://www.tidytextmining.com/sentiment.html") 
```

The output is a little hard to read though! That's easily solved

```R
code %>% cat
```


`rawr` currently supports github, kaggle, datacamp, and many blogdown sites. Try it

```R
library(rawr)
library(dplyr)

rawr("https://www.datacamp.com/community/tutorials/sentiment-analysis-R") %>% cat
rawr("https://github.com/hadley/vis-eda/blob/master/travel.R") %>% cat
rawr("https://www.kaggle.com/vrtjso/mercari-eda-more-info-than-you-can-imagine") %>% cat
rawr("https://www.jtimm.net/2019/04/14/lexical-change-procrustes/") %>% cat
```

### Advanced use

Send output to a temp file

```R
rawr("https://www.kaggle.com/vrtjso/mercari-eda-more-info-than-you-can-imagine", to_file=T)
```

Send output to a specific file

```R
rawr("https://www.kaggle.com/vrtjso/mercari-eda-more-info-than-you-can-imagine", file_path="mynewfile.R")
```

If `rawr()` returns no result (or if the result is non-sense), try another `method`

```R
"https://www.datacamp.com/community/tutorials/keras-r-deep-learning" %>% rawr %>% cat
# no result

https://www.datacamp.com/community/tutorials/keras-r-deep-learning" %>% rawr(method = 2) %>% cat 
# returns correct output
```

## Further Documentation and Examples

See:

```R
?rawr::rawr
?rawr::datacamp
?rawr::github
?rawr::kaggle
?rawr::tidytext
```




# Issues and Feature Requests

When reporting an issue, please include:

* Example code that reproduces the **observed** behavior.
* An explanation of what the **expected** behavior is.
* A specific url you're attempting to retrieve R code from (if that's what your issue concerns)


For feature requests, raise an issue with the following:

* The desired functionality
* Example inputs and desired output



# Pull Requests

Pull requests are welcomed. 

Any new functions should follow the conventions established by the the package's existing functions. Please ensure

* Functions are sensibly named
* The __intent__ of the contribution is clear
* At least one example is provided in the documentation






