#' Identify the domain of the url
#'
#'
#' @name identify_domain
#'
#' @usage identify_domain(urls)
#'
#' @param urls Vector of urls
#'
#' @return A character vector of length 1 containing the website domain.
#'
#' @import dplyr jsonlite xml2
#' @importFrom rvest html_nodes html_text html_attr
#'
#' @export
#'
#' @examples
#'
#' test_domains <- c("https://github.com/hadley/vis-eda/blob/master/travel.R",
#' "https://www.datacamp.com/community/tutorials/sentiment-analysis-R",
#' "https://www.tidytextmining.com/sentiment.html",
#' "https://www.kaggle.com/vrtjso/mercari-eda-more-info-than-you-can-imagine")
#'
#' identify_domain(test_domains)
#'
#'
#'


identify_domain <- function(urls) {

  discard_empty_elements <- function(vec) {
    vec %>% unlist %>% {. != "" } %>% { vec[.] }
  }

  # We want what's after either https://, http://, https://www., http://www.
  # urls %>% str_split(., "https://")

  urls %>%
    strsplit(., "https://www.|https://") %>%
    sapply(discard_empty_elements) %>%
    strsplit(., "\\.") %>% sapply(., function(x) { x[1] })

}




