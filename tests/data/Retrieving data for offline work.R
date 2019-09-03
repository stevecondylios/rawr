
library(rvest)
library(dplyr)

read_html("https://www.tidytextmining.com/sentiment.html") %>%
  write_xml("tests/data/tidytext.xml")

read_html("https://www.datacamp.com/community/tutorials/sentiment-analysis-R") %>%
  write_xml("tests/data/datacamp.xml")

read_html("https://github.com/hadley/vis-eda/blob/master/travel.R") %>%
  write_xml("tests/data/github.xml")

read_html("https://www.kaggle.com/vrtjso/mercari-eda-more-info-than-you-can-imagine") %>%
  write_xml("tests/data/kaggle.xml")


tidytext_html <- read_html("tests/data/tidytext.xml")
datacamp_html <- read_html("tests/data/datacamp.xml")
github_html <- read_html("tests/data/github.xml")
kaggle_html <- read_html("tests/data/kaggle.xml")














