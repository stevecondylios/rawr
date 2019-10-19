#' Retrieve r code from Medium article or Towards Data Science article
#'
#'
#' @name medium
#'
#' @usage medium(url, method, padding)
#'
#' @param url Link to a medium or towards data science article
#' @param method Not all websites are formatted consistently. To overcome this, try a different
#'     method by setting the method parameter to integers 2 and greater to try
#'     other available methods
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
#' url <-"https://medium.com/@@data_datum/ggplot2-or-how-to-make-fancy-graphics-with-r-fabae7fc16d4"
#' medium(url)
#'



medium <- function(url, method = 1, padding = "\n\n") {

  make_class <- function(class_input) {
    str_replace_all(class_input, " ", ".") %>% paste0(".", .)
  }


  if(method == 1) {
  # url <-"https://medium.com/@data_datum/ggplot2-or-how-to-make-fancy-graphics-with-r-fabae7fc16d4"
  page_html <- url %>% read_html %>% html_nodes(make_class("lh li lj lk ll gp dy lm"))
  temp <- page_html %>% as.character %>%  str_replace_all("<br>|<br/>", "&#10;")

  # Loop necessary as read_html doesn't play nice with sapply
  # See: https://github.com/r-lib/xml2/issues/15
  output <- c()
  for(i in 1:length(temp)) {
    output[i] <- temp[i] %>% read_html %>% html_text %>% paste0(padding)
    output[i]
    }
  output
  } # End method 1


  ## Placeholder for towards data science
  # "https://towardsdatascience.com/5-lines-of-code-to-convince-you-to-learn-r-81efb2e3c836"
  # "mu mv cl aq nm b bi nn no l np"



  ## Placeholder for extracting github gists from medium articles
  # Unsure how to maintain order between regular code and any gists used
  # # Medium with gist
  # # https://medium.com/@kyleake/wikipedia-data-scraping-with-r-rvest-in-action-3c419db9af2d
  # med_gist <- "https://medium.com/media/59cc7594096daf2503a047c5f8afb8b3"
  # med_gist %>% read_html %>% html_nodes("script") %>% html_attr("src") %>% .[1] %>%
  #   strsplit(".js") %>%
  #   .[[1]] %>% .[1] %>% read_html %>% html_text

  # Note: how to extract >1 type of elements but retain the order (link over two lines)
  # https://stackoverflow.com/questions/58465175/extract-more-than-one-type-of-element-
  # whilst-preserving-order-using-rvest-or-si/58467172#58467172


}























