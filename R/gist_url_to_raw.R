#' Convert github gist url into equilvalent url for raw code
#'
#'
#' @name gist_url_to_raw
#'
#' @usage gist_url_to_raw(url)
#'
#' @param url Link to a github gist
#'
#' @return A character vector of length 1 containing url for the raw version of the github gist
#'
#' @import dplyr jsonlite xml2 stringr
#' @importFrom rvest html_nodes html_text html_attr
#'
#' @export
#'
#' @examples
#'
#' gist_url_to_raw("https://gist.github.com/korkridake/ea96f6569f5a4f9a1a552145e6151235")
#'


gist_url_to_raw <- function(url) {
    url %>% str_replace("gist.github.com", "gist.githubusercontent.com") %>% paste0(., "/raw/")
  }



