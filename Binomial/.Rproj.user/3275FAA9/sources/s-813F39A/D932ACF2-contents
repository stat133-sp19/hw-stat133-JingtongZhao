# 1.1) Private Checker Functions

# private function to check if an input prob is a valid probability value
check_prob <- function(prob) {
  if (length(prob) != 1) {
    stop("\n prob must be a vector of length 1")
  } 
  if (!(prob >= 0 & prob <= 1)) {
    stop("\n prob has to be a number betwen 0 and 1")
  }  
  TRUE
}

# private function to check if an input trials is a valid value for number of trials
check_trials <- function(trials) {
  if (length(trials) != 1) {
    stop("\n trials must be a vector of length 1")
  } 
  if (!is.numeric(trials)){
    stop("\n trials should be a non-negative integer")
  }
  if (!(trials == abs(round(trials)))) {
    stop("\n trials should be a non-negative integer")
  }
  TRUE
}

# private function to check if an input success is a valid value for number of successes
check_success <- function(success,trials) {
  if (!any(is.numeric(success))){
    stop("\n success should be a non-negative integer")
  }
  if (!any((success == abs(round(success))))) {
    stop("\n success should be a non-negative integer")
  }
  if (any(success > trials)) {
    stop("\n success cannot be greater than trials'")
  }
  TRUE
}

# 1.2) Private Auxiliary Functions
# aux_mean(): the expected number of successes in n trials.
aux_mean = function(n,p){
  mean = n*p
  return(mean)
}

# aux_variance(): 
aux_variance = function(n,p){
  variance = n*p*(1 - p)
  return(variance)
}

# aux_mode():the most likely number of success in n independent trials with probability p 
# of success on each trial is m:
aux_mode = function(n,p){
  mode = floor(n*p + p)
  return(mode)
}

# aux_skewness(): a measure of the asymmetry of the probability distribution of 
# a random variable about its mean
aux_skewness = function(n,p){
  skewness = (1 - 2*p)/sqrt(n*p*(1 - p))
  return(skewness)
}

# aux_kurtosis()
aux_kurtosis = function(n,p){
  kurtosis = (1 - 6*p*(1 - p))/(n*p*(1 - p))
  return(kurtosis)
}

# 1.3) Function bin_choose()
#' @title Binomial combinations
#' @description calculates the number of combinations in which k successes can occur in n trials
#' @param n number of fixed trials
#' @param k the number of successes out of n trials
#' @return the number of combination
#' @export
#' @examples
#' bin_choose(n = 5, k = 2)
#' bin_choose(5, 0)
#' bin_choose(5, 1:3)

bin_choose = function(n,k) {
  if (any(k > n)) {
    stop("\n k cannot be greater than n")
  }
  combination = factorial(n)/(factorial(k)*factorial(n - k))
  return(combination)
}

# 1.4) Function bin_probability()
#' @title Binomial Probability
#' @description calculates probabilities about the number of successes in a fixed number of random trials performed
#' under identical conditions
#' @param trials number of fixed trials
#' @param prob probability of success on each trial
#' @param success the number of successes out of n trials
#' @return probabilities about the number of successes
#' @export
#' @examples
#' #probability of getting 2 successes in 5 trials (assuming prob of success = 0.5)
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)

#' #probabilities of getting 2 or less successes in 5 trials (assuming prob of success = 0.5)
#' bin_probability(success = 2, trials = 5, prob = 0.5)

#' #55 heads in 100 tosses of a loaded coin with 45% chance of heads
#' bin_probability(success = 55, trials = 100, prob = 0.45)

bin_probability = function(success, trials, prob){
  check_success(success,trials)
  check_prob(prob)
  check_trials(trials)
  prob = bin_choose(trials,success)*(prob^success)*((1-prob)^(trials-success))
  return(prob)
}

# 1.5) Function bin_distribution()
#' @title Binomial Distribution
#' @description calculates probabilities based on different number of successes in a fixed number of random trials performed
#' under identical conditions
#' @param trials number of fixed trials
#' @param prob probability of success on each trial
#' @return an object of class \code{"bindis"}
#' @export 
#' @examples
#' #binomial probability distribution
#' bin_distribution(trials = 5, prob = 0.5)

bin_distribution = function(trials, prob){
  success = 0:trials
  probability = bin_probability(success, trials, prob)
  dist = data.frame(success,probability)
  class(dist) = c("bindis","data.frame")
  return(dist)
}

#' @export
plot.bindis = function(x,...){
  barplot(height = x$probability,names.arg = x$success,xlab="Success",ylab="Probability",
          main="Binomial Probability Distribution")
}

# 1.6) Function bin_cumulative()
#' @title Binomial Cumulative
#' @description calculates the cumulative probability of successes. It generates a data frame 
#' with both the probability distribution and the cumulative probabilities: 
#' sucesses in the first column, probability in the second column, and cumulative in the third column.
#' @param trials number of fixed trials
#' @param prob probability of success on each trial
#' @return an object of class \code{"bincum"}
#' @export 
#' @examples
#' #binomial cumulative distribution
#' bin_cumulative(trials = 5, prob = 0.5)

bin_cumulative = function(trials, prob){
  cum = bin_distribution(trials, prob)
  cumulative = rep(0,trials+1)
  cumulative[1] = cum$probability[1]
  for (i in 2:(trials+1)){
    cumulative[i] = cumulative[i-1] + cum$probability[i]
  }
  cum$cumulative = cumulative
  class(cum) = c("bincum","data.frame")
  return(cum)
}

#' @export 
plot.bincum = function(x,...){
  plot(x = x$success, y = x$cumulative,xlab="Successes",ylab="Probability",
       main="Binomial Probability Distribution")
  lines(x = x$success, y = x$cumulative)
}

# 1.7) Function bin_variable()
#' @title Binomial Variable
#' @description takes in trials and prob and returns a list with trials: 
#' number of trials and prob: probability of success.
#' @param trials number of fixed trials
#' @param prob probability of success on each trial
#' @return an object of class \code{"binvar"}
#' @export 
#' @examples
#' bin_variable(trials = 10, p = 0.3)

bin_variable = function(trials, prob){
  check_prob(prob)
  check_trials(trials)
  var = list(trials = trials, prob = prob)
  class(var) = "binvar"
  return(var)
}

#' @export
print.binvar = function(x,...){
  cat('"Binomial variable" \n\n')
  cat('Parameters \n')
  cat(sprintf("- number of trials: %s", x$trials[1]), "\n")
  cat(sprintf("- prob of success: %s", x$prob[1]), "\n")
}

#' @export
summary.binvar = function(object,...){
  x = object
  var_list = list(trials = x$trials,
                  prob = x$prob,
                  mean = aux_mean(x$trials[1],x$prob[1]),
                  variance = aux_variance(x$trials[1],x$prob[1]),
                  mode = aux_mode(x$trials[1],x$prob[1]),
                  skewness = aux_skewness(x$trials[1],x$prob[1]),
                  kurtosis = aux_kurtosis(x$trials[1],x$prob[1]))
  class(var_list) = "summary.binvar"
  return(var_list)                 
}

#' @export
print.summary.binvar = function(x,...){
  cat('"Summary variable" \n\n')
  cat('Parameters \n')
  cat(sprintf("- number of trials: %s", x$trials[1]), "\n")
  cat(sprintf("- prob of success: %s", x$prob[1]), "\n\n")
  cat('Measures \n')
  cat(sprintf("- mean: %s",summary.binvar(x)[[3]]), "\n")
  cat(sprintf("- variance: %s", summary.binvar(x)[[4]]), "\n")
  cat(sprintf("- mode: %s",summary.binvar(x)[[5]]), "\n")
  cat(sprintf("- skewness: %0.7f", summary.binvar(x)[[6]]), "\n")
  cat(sprintf("- kurtosis: %0.7f",summary.binvar(x)[[7]]), "\n")
}

## 1.8) Functions of measures
#' @title Binomial mean
#' @description calculates the expected number of successes in n trials.
#' @param trials number of fixed trials
#' @param prob the number of successes out of n trials
#' @return mean of a binomial distribution
#' @export
#' @examples
#' bin_mean(10, 0.3)

bin_mean = function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  mean = aux_mean(trials,prob)
  return(mean)
}

#' @title Binomial variance
#' @description calculates the variance of a binomial distribution
#' @param trials number of fixed trials
#' @param prob probability of success on each trial
#' @return variance of a binomial distribution
#' @export
#' @examples
#' bin_variance(10, 0.3)

bin_variance = function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  variance = aux_variance(trials,prob)
  return(variance)
}

#' @title Binomial mode
#' @description calculates the mode of a binomial distribution
#' @param trials number of fixed trials
#' @param prob probability of success on each trial
#' @return mode of a binomial distribution
#' @export
#' @examples
#' bin_mode(10, 0.3)

bin_mode = function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  mode = aux_mode(trials,prob)
  return(mode)
}

#' @title Binomial skewness
#' @description calculates the skewness of a binomial distribution
#' @param trials number of fixed trials
#' @param prob probability of success on each trial
#' @return skewness of a binomial distribution
#' @export
#' @examples
#' bin_skewness(10, 0.3)

bin_skewness = function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  skewness = aux_skewness(trials,prob)
  return(skewness)
}

#' @title Binomial kurtosis
#' @description calculates the kurtosis of a binomial distribution
#' @param trials number of fixed trials
#' @param prob probability of success on each trial
#' @return kurtosis of a binomial distribution
#' @export
#' @examples
#' bin_kurtosis(10, 0.3)

bin_kurtosis = function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  kurtosis = aux_kurtosis(trials,prob)
  return(kurtosis)
}
