% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Binomial.R
\name{bin_distribution}
\alias{bin_distribution}
\title{Binomial Distribution}
\usage{
bin_distribution(trials, prob)
}
\arguments{
\item{trials}{number of fixed trials}

\item{prob}{probability of success on each trial}
}
\value{
an object of class \code{"bindis"}
}
\description{
calculates probabilities based on different number of successes in a fixed number of random trials performed
under identical conditions
}
\examples{
#binomial probability distribution
bin_distribution(trials = 5, prob = 0.5)
}
