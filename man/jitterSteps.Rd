\name{jitterSteps}
\alias{jitterSteps}
\title{Compute a perturbed version of the dose-variable }
\description{
  Compute a perturbed version of the dose-variable -
  such that all the measurements can be seen in plots. }
\usage{ jitterSteps(dataFrame) }
\arguments{
  \item{dataFrame}{ A \link{data.frame} with columns \code{Sample},
    \code{Response}, \code{Dilution}, and \code{Z}. } }
\value{ \link{data.frame} with rows of individual observations and
  columns of treatments, block, response-value, etc. plus a new column
  \code{Zjitter}. }
\author{Jens Henrik Badsberg}
\keyword{ mich }
