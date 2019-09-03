
context("Errors and warns appropriately")


test_that("errors when url doesn't contain http or https", {
  url <- "https://github.com/hadley/vis-eda/blob/master/travel.R" %>% sub("https://", "", .)

  expect_error(
    rawr::github(url)
    ,

    "Invalid url - must start with https or http")
})






