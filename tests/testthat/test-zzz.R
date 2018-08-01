context("test-zzz.R")

test_that("Test UserDir loads", {
  testthat::expect_true(exists("UserDir"))
})
