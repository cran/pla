\name{Fiellers}
\alias{Fiellers}
\title{
Fiellers confidence interval
}
\description{
Computes Fiellers confidence interval for the ratio of two normal.
}
\usage{
Fiellers(model,
         Which = 1:length(which(b)),
         sample = "Sample", 
         factor = paste0("factor(", sample, ")"), 
         independent = "Z", 
         df = summary(model)$df[2], 
         alpha = 0.05)
}
\arguments{
  \item{model}{ An object of class \link{lm}. }
  \item{Which}{ The indices of the 'intercepts' to divide by the slope. }
  \item{sample}{ The names, factor levels, of the intercepts. }
  \item{factor}{ The names of the parameters for intercepts in the
    \link{coef} of the linear model. }
  \item{independent}{ The name of the independent variable for the
    slope. }
  \item{df}{ An integer. }
  \item{alpha}{ A real number, preferable between 0 and 1. }
}
\references{
  Fieller, E.C.: The biological standardization of insulin. Supplement to the
  Journal of the Royal Statistical Society. 1940; Vol. VII., No. 1.
}
\author{Jens Henrik Badsberg <pla2015@badsberg.eu>}
\keyword{ design }
