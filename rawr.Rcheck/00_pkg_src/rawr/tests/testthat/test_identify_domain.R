

context("Correctly identify domains")


test_that("identify_domain() correctly identifies domains", {

  test_domains <- c("https://github.com/hadley/vis-eda/blob/master/travel.R",
                    "https://www.datacamp.com/community/tutorials/sentiment-analysis-R",
                    "https://www.tidytextmining.com/sentiment.html",
                    "https://www.kaggle.com/vrtjso/mercari-eda-more-info-than-you-can-imagine")


  expect_equal(
    rawr::identify_domain(test_domains)
    ,

    c("github", "datacamp", "tidytextmining", "kaggle")
)

})












