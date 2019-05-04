context("Check binomial argument prob")

##check_prob
test_that("check_prob with ok vectors", {
  expect_true(check_prob(0))
  expect_true(check_prob(1))
})

test_that("check_prob fails with invalid lengths", {
  expect_error(check_prob(c(1,2)))
  expect_error(check_prob(1:2))
})

test_that("check_prob fails with invalid numbers", {
  expect_error(check_prob(100))
  expect_error(check_prob(-0.5))
  expect_error(check_prob("prob"))
})

context("Check binomial argument trials")
##check_trials
test_that("check_trials with ok vectors", {
  expect_true(check_trials(3))
  expect_true(check_trials(10))
})

test_that("check_trials fails with invalid lengths", {
  expect_error(check_trials(c(1,2)))
  expect_error(check_trials(5:10))
})

test_that("check_trials fails with invalid numbers", {
  expect_error(check_trials(10.5))
  expect_error(check_trials(-5))
})

context("Check binomial argument success")
##check_success
test_that("check_success with ok vectors", {
  expect_true(check_success(3,5))
  expect_true(check_success(10,10))
})

test_that("check_success with valid lengths", {
  expect_true(check_success(c(1,2),3))
  expect_true(check_success(5:10,12))
})

test_that("check_success fails with invalid numbers", {
  expect_error(check_success(10.5,20))
  expect_error(check_success(-5,20))
})

test_that("check_success fails with success greater than trials", {
  expect_error(check_success(10,5))
})
