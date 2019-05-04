context("Check binomial")

##bin_choose
test_that("bin_choose fails when k > n", {
  expect_error(bin_choose(5,6))
})

test_that("aux_mean works as expected", {
  expect_equal(bin_choose(5,2),factorial(5)/(factorial(2)*factorial(5 - 2)))
  expect_equal(bin_choose(5, 1:3),c(5,10,10))
  expect_length(bin_choose(5, 1:2), 2)
  expect_type(bin_choose(5,2), 'double')
})

##bin_probability
test_that("bin_probability fails with invalid trial value", {
  expect_error(bin_probability(success = 2, trials = 6.1, prob = 0.5))
})

test_that("bin_probability fails with invalid success value", {
  expect_error(bin_probability(success = -1, trials = 5, prob = 0.5))
})

test_that("bin_probability fails with invalid prob value", {
  expect_error(bin_probability(success = 2, trials = 5, prob = -0.5))
})

test_that("bin_probability works as expected", {
  expect_equal(bin_probability(2,5,0.5),0.3125)
  expect_equal(bin_probability(0:2,5,0.5),c(0.03125,0.15625,0.31250))
  expect_length(bin_probability(0:2,5,0.5), 3)
  expect_type(bin_probability(0:2,5,0.5), 'double')
})

## bin_distribution
test_that("data type in bin_distribution is correct", {
  expect_is(bin_distribution(trials = 5, prob = 0.5),c("bindis","data.frame"))
})

test_that('data dimensions are correct', {
  expect_equal(ncol(bin_distribution(trials = 5, prob = 0.5)), 2)
  expect_equal(nrow(bin_distribution(trials = 5, prob = 0.5)), 6)
})

## bin_cumulative
test_that("data type in bin_cumulative is correct", {
  expect_is(bin_cumulative(trials = 5, prob = 0.5),c("bindcum","data.frame"))
})

test_that('data dimensions are correct', {
  expect_equal(ncol(bin_cumulative(trials = 5, prob = 0.5)), 3)
  expect_equal(nrow(bin_cumulative(trials = 5, prob = 0.5)), 6)
})

