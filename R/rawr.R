#' Automatically identify website and retrieve raw R code from it
#'
#'
#' @name rawr
#'
#' @usage rawr(url)
#'
#' @param url Link to an R file on supported website (github, kaggle, datacamp, tidytext)
#'
#' @import dplyr jsonlite xml2
#' @importFrom rvest html_nodes html_text html_attr
#'
#' @export
#'
#' @examples
#' \dontrun{
#' rawr("https://github.com/hadley/vis-eda/blob/master/travel.R")
#'
#' # Same as above but provided to cat for easy viewing
#' rawr("https://github.com/hadley/vis-eda/blob/master/travel.R") %>%
#'   cat
#'
#'
#' # Use on multiple urls
#'
#' domains <- c("https://github.com/hadley/vis-eda/blob/master/travel.R",
#' "https://www.datacamp.com/community/tutorials/sentiment-analysis-R",
#' "https://www.tidytextmining.com/sentiment.html",
#' "https://www.kaggle.com/vrtjso/mercari-eda-more-info-than-you-can-imagine")
#'
#' domains %>% sapply(rawr)
#'}


library(stringr)


rawr <- function(url) {

  if(substr(url, 1, 4) != "http") { stop("Invalid url - must start with https or http") }

  # Identify domain
  domain <- url %>% identify_domain

  if(length(domain) > 1) { stop("rawr::rawr only handles one url at a time,
                                try sapply(your_urls, rawr::rawr)") }

  switch(domain,
         "github"= { github(url) },
         "kaggle"= { kaggle(url) },
         "datacamp"= { datacamp(url) },
         "tidytextmining"= { tidytext(url) }
  )

}




