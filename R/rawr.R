#' Retrieve raw R code from any github, kaggle, stack overflow, blogdown, or data camp web page
#'
#'
#' @name rawr
#'
#' @usage rawr(url, to_file, file_path, method, padding)
#'
#' @param url Link to an R file on supported website (github, kaggle, datacamp, tidytext)
#' @param to_file Boolean to state whether to return output into a new file. Default is false.
#' @param file_path Specifies a file path and file name. The default is to
#'     create a randomly named temp file (see ?tempfile for further information)
#' @param method Not all websites are formatted consistently. To overcome this, rawr may have
#'     more than one method for any site. If what rawr returns is not sensible, try setting method
#'     parameter to integers 2 and greater to try other available methods
#' @param padding Specify what goes between the last character of one code block and the
#'     first character of the next code block. Default is a two new lines, which appears
#'     visually as one new line between code blocks.
#'
#' @return A character vector of length 1. rawr attempts to retrieve and return the raw R code it
#'     finds at the target url. In the case of blogdown pages, all code will be returned (not just)
#'     R code, and in the case of kaggle, all of R (R markdown) and Python code will be returned.
#'
#' @import dplyr jsonlite xml2
#' @importFrom rvest html_nodes html_text html_attr
#'
#' @export
#'
#' @examples
#' \donttest{
#' library(dplyr)
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
#' "https://www.kaggle.com/vrtjso/mercari-eda-more-info-than-you-can-imagine",
#' "https://www.jtimm.net/2019/04/14/lexical-change-procrustes/")
#'
#' domains %>% sapply(rawr)
#'
#'  # When default method doesn't return a sensible result, try a different method
#'
#'  "https://www.datacamp.com/community/tutorials/keras-r-deep-learning" %>% rawr %>% cat
#'  # no result
#'
#' # Let's try another method
#' "https://www.datacamp.com/community/tutorials/keras-r-deep-learning" %>%
#'    rawr(method = 2) %>%
#'    cat # from inspection of output we see this method returns code correctly
#'
#' # Write output to a temp file
#'   "https://www.datacamp.com/community/tutorials/R-nlp-machine-learning" %>% rawr(to_file = T)
#'
#' # Or to a new file (provide a file name)
#' "https://www.datacamp.com/community/tutorials/R-nlp-machine-learning" %>%
#'   rawr(to_file = T, file_path = "yourfile.R")
#'
#'
#'
#'
#' }
#'
#'
#'
#'
#'



rawr <- function(url, to_file = F, file_path, method = 1, padding = "\n\n") {

  if(substr(url, 1, 4) != "http") { stop("Invalid url - must start with https or http") }

  # Identify domain
  domain <- url %>% identify_domain

  if(length(domain) > 1) { stop("rawr::rawr only handles one url at a time,
                                try sapply(your_urls, rawr::rawr)") }

  output <- switch(domain,
         "github"= { github(url, method, padding) },
         "kaggle"= { kaggle(url, method, padding) },
         "datacamp"= { datacamp(url, method, padding) },
         "tidytextmining"= { tidytext(url, method, padding) },
         "stackoverflow" = { stackoverflow(url, method, padding) },
         { blogdown(url) } # Default behaviour
  )

  # Logic:
  # If file_path is provided, assume to_file is true, and write to location file_path
  # If to_file is missing or false (default), print to console

  if(!missing(file_path)) {
    to_file = T
  }

  if(to_file) {

    if(missing(file_path)) { file_path <-  tempfile() }
    output %>% output_to_file(file_path)

    # Provide a helpful message
    if(file_path == T) {

      temp <- if(grepl(tempdir(), file_path)) { T } else { F }

      message_to_print <- paste0("Creating new ",
                                 if(temp) { "temp " }, # Simply inserts 'temp' if it's a tempfile
                                 "file: ",
                                 file_path)
      print(message_to_print)
    } # end message

  } else {

    output

  }

}




