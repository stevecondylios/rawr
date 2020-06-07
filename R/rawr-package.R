#'
#' @docType package
#'
#' @details It has the goal of providing a very simple way of quickly retrieving (just the)
#'     raw R code from popular websites that display R code, including:
#' \itemize{
#'  \item{github  }{<https://github.com>}
#'  \item{kaggle  }{<https://www.kaggle.com>}
#'  \item{datacamp  }{<https://www.datacamp.com>, and,}
#'  \item{R blogdown  }{<https://github.com/rstudio/blogdown>}
#' }
#'     thus enabling quick and easy code execution in the user's local environment.
#'
#'
#' @author Steve Condylios \email{steve.condylios@gmail.com}
#'
#'
#'
#' @name rawr-package
#'
#'
#' @description Retrieve Raw R Code from Popular Tutorials and Websites
#'
# NULL

# quiets concerns of R CMD check re: the .'s that appear in pipelines
if(getRversion() >= "2.15.1")  utils::globalVariables(c("."))
