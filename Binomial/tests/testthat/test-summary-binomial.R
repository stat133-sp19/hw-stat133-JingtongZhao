context("Check binomial summary measures")

##aux_mean
test_that("aux_mean works as expected", {
  expect_equal(aux_mean(5,0.5),2.5)
  expect_equal(aux_mean(2,0),0)
  expect_length(aux_mean(5,0.5), 1)
  expect_type(aux_mean(5,0.5), 'double')
})

##aux_variance
test_that("aux_variance works as expected", {
  expect_equal(aux_variance(5,0.5),5*0.5*(1 - 0.5))
  expect_equal(aux_variance(2,0),2*0*(1 - 0))
  expect_length(aux_variance(5,0.5), 1)
  expect_type(aux_variance(5,0.5), 'double')
})

##aux_mode
test_that("aux_mode works as expected", {
  expect_equal(aux_mode(5,0.5),floor(5*0.5 + 0.5))
  expect_equal(aux_mode(2,0),floor(2*0 + 0))
  expect_length(aux_mode(5,0.5), 1)
  expect_type(aux_mode(5,0.5), 'double')
})

##aux_skewness
test_that("aux_skewness works as expected", {
  expect_equal(aux_skewness(5,0.5),(1 - 2*0.5)/sqrt(5*0.5*(1 - 0.5)))
  expect_equal(aux_skewness(2,0),(1 - 2*0)/sqrt(2*0*(1 - 0)))
  expect_length(aux_skewness(5,0.5), 1)
  expect_type(aux_skewness(5,0.5), 'double')
})

##aux_kurtosis
test_that("aux_kurtosis works as expected", {
  expect_equal(aux_kurtosis(5,0.5),(1 - 6*0.5*(1 - 0.5))/(5*0.5*(1 - 0.5)))
  expect_equal(aux_kurtosis(2,0),(1 - 6*0*(1 - 0))/(2*0*(1 - 0)))
  expect_length(aux_kurtosis(5,0.5), 1)
  expect_type(aux_kurtosis(5,0.5), 'double')
})
