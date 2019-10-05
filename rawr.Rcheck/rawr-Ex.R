pkgname <- "rawr"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
base::assign(".ExTimings", "rawr-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('rawr')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("blogdown")
### * blogdown

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: blogdown
### Title: Retrieve raw R code from a blogdown web page
### Aliases: blogdown

### ** Examples

library(dplyr)
blogdown("https://www.jtimm.net/2019/04/14/lexical-change-procrustes/")

# Same as above but provided to cat for easy viewing
blogdown("https://www.jtimm.net/2019/04/14/lexical-change-procrustes/")  %>%
  cat




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("blogdown", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("datacamp")
### * datacamp

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: datacamp
### Title: Retrieve raw R code from a datacamp tutorial
### Aliases: datacamp

### ** Examples





base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("datacamp", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("github")
### * github

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: github
### Title: Retrieve raw R code from an .R file hosted on github website
### Aliases: github

### ** Examples

library(dplyr)
github("https://github.com/hadley/vis-eda/blob/master/travel.R")

# Same as above but provided to cat for easy viewing
github("https://github.com/hadley/vis-eda/blob/master/travel.R") %>%
  cat





base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("github", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("identify_domain")
### * identify_domain

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: identify_domain
### Title: Identify the domain of the url
### Aliases: identify_domain

### ** Examples


test_domains <- c("https://github.com/hadley/vis-eda/blob/master/travel.R",
"https://www.datacamp.com/community/tutorials/sentiment-analysis-R",
"https://www.tidytextmining.com/sentiment.html",
"https://www.kaggle.com/vrtjso/mercari-eda-more-info-than-you-can-imagine")

identify_domain(test_domains)






base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("identify_domain", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("kaggle")
### * kaggle

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: kaggle
### Title: Retrieve raw R code from a kaggle notebook
### Aliases: kaggle

### ** Examples




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("kaggle", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("output_to_file")
### * output_to_file

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: output_to_file
### Title: Open contents in a new tempfile or file
### Aliases: output_to_file

### ** Examples


## Not run: 
##D code_sample <- "#Sample code\nx <- 6\n2 * 2"
##D output_to_file(code_sample)
## End(Not run)







base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("output_to_file", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("rawr")
### * rawr

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: rawr
### Title: Automatically identify website and retrieve raw R code from it
### Aliases: rawr

### ** Examples









base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("rawr", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("stackoverflow")
### * stackoverflow

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: stackoverflow
### Title: Retrieve raw R code from Stack Overflow website
### Aliases: stackoverflow

### ** Examples

library(dplyr)
stackoverflow("https://stackoverflow.com/questions/58248102/date-input-dt-r-shiny")

# Same as above but provided to cat for easy viewing
stackoverflow("https://stackoverflow.com/questions/58248102/date-input-dt-r-shiny") %>%
  cat





base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("stackoverflow", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("tidytext")
### * tidytext

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: tidytext
### Title: Retrieve raw R code tidytext tutorial
### Aliases: tidytext tidytextmining

### ** Examples

library(dplyr)
tidytext("https://www.tidytextmining.com/sentiment.html")

# Same as above but provided to cat for easy viewing
tidytext("https://www.tidytextmining.com/sentiment.html") %>%
  cat





base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("tidytext", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
