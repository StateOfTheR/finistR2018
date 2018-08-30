test_that("If it quacks like a duck, it's a duck", {
  expect_equal("quack", "quack")
  expect_is(estimate(rnorm(10), rnorm(10)), class = "numeric")
})
## https://journal.r-project.org/archive/2011-1/RJournal_2011-1_Wickham.pdf
