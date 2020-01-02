#' Retrieve raw R code from an .R file hosted on github website
#'
#'
#' @name github
#'
#' @usage github(url, method, padding)
#'
#' @param url Link to an R file on github website
#' @param method Not all websites are formatted consistently. To overcome this, try a different
#'     method by setting the method
#'     parameter to integers 2 and greater to try other available methods
#' @param padding Specify what goes between the last character of one code block and the
#'     first character of the next code block. Default is a two new lines, which appears
#'     visually as one new line between code blocks.
#'
#' @return A character vector of length 1 containing the R code from the target url. All code
#'    at the target url (including javascript, ruby, python) will be returned.
#'
#' @import dplyr jsonlite xml2
#' @importFrom rvest html_nodes html_text html_attr
#' @importFrom utils file.edit
#'
#' @export
#'
#' @examples
#' library(dplyr)
#' github("https://github.com/hadley/vis-eda/blob/master/travel.R")
#'
#' # Same as above but provided to cat for easy viewing
#' github("https://github.com/hadley/vis-eda/blob/master/travel.R") %>%
#'   cat
#'
#'


github <- function(url, method, padding = "\n\n") {

  if(substr(url, 1, 4) != "http") { stop("Invalid url - must start with https or http") }


  # .md files on github have the .md extension, but the contents of README.md is also
  # displayed at the repository root, e.g. https://github.com/stevecondylios/rawr
  # So we should scan for these special cases and treat appropriately

  # test_one <- "https://github.com/stevecondylios/rawr"
  # test_two <- "https://github.com/stevecondylios/rawr/"
  # test_three <- "https://github.com/stevecondylios/rawr"

  # Github repository names can have letters, numbers, -, _ and .
  # https://stackoverflow.com/a/59082561

  # Logic: if we see https://github.com/REGEX/REGEX$ (note the end of string), then
  # we consider it a README and parse accordingly

  # Check by looking for (github.com/./.$)
  # if(grepl("github.com/*/[[:alnum:]]", url))


  # User may provide a github 'raw' or regular url
  if(!grepl("githubusercontent", url)) {
    # Remove 'blob' from url
    url <- url %>% strsplit(., "/") %>% unlist %>% .[-6] %>% paste0(collapse="/") %>%

      # replace domain and read
      sub("github.com", "raw.githubusercontent.com", .)
  }

  url %>%
    readLines %>%
    paste0(collapse=padding)


}




