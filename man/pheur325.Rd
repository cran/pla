\name{pheur325}
\alias{pheur325}
\title{Potency with confidence intervals}
\description{
  Estimation of potency and confidence limits as described at
  page 480 in Ph.Eur (but with the \code{Sums Of Squares} computed by
  \link{lm}).

  If complete data analyses is performed, then the slope and contrasts
  of intercepts are returned form the \link{lm}-fit, and confidence
  intervals for potency computed by Fieller's theorem.
}
\usage{
pheur325(data,
         lmInteraction = NULL,
         lmRestricted = NULL,
         dr = 2,
         response = "Response",
         sampleLabels = levels(unlist(data["Sample"])),
         indexOfReference = 1,
         StdName = sampleLabels[indexOfReference],
         sampleStepName = "SampleStep",
         dfAdj = 0,
         factor = 1.0, 
         alpha = 0.05)
}
\arguments{
  \item{data}{ \link{data.frame} with the columns \code{response} and
    \code{sampleStepName}. Note that the slope then is determined by
    only the additional dilution ratio \code{dr}. }
  \item{lmInteraction}{ Linear model for ANOVA table - with Sums of Squares.  }
  \item{lmRestricted}{ Linear model with estimates of regression parameters for
    complete analysis - when missing values are present. }
  \item{dr}{ The dilution ratio of the equally spaced dilutions,
    see \link{data2assayFrame}. }
  \item{response}{ A character string giving the name of the
    \code{response} column of \code{data}.  }
  \item{sampleLabels}{
    A vector of character strings giving the labels of the \code{samples}. 
    If \code{data["Sample"]} has one of these values, then these rows are used.
    These labels are also used for labels of the returned values.
    % The values of \code{Sample} for the \code{Standard} should be
    % \code{S} regardless of these labels, and match a level of the
    % columns \code{Sample} og the input data \code{data}.
  }
  \item{indexOfReference}{ Index of the reference among the samples
    given by \code{sampleLabels}. If \code{data["Sample"]} has this
    value, then these rows are from the 'reference'.
    %  The following is now not the case:
    %    This index is the levels of the factor \code{Sample} in the input
    %    data. Thus if the order of the labels \code{sampleLabels} does
    %    not match the order of the levels of he factor \code{Sample} of the
    %    input data, you will get unexpected results.
  }
  \item{StdName}{ A character string identifying the reference in the
    columns "Sample" of the input data.  }
  \item{sampleStepName}{ A character string giving the name of the
    \code{sampleStepName} column of \code{data}. This variable should
    identify both the \code{preparation} and the \code{dilution step}. }
  \item{dfAdj}{ The needed adjustment of the number of degrees of freedom,
    if e.g. data are corrected for blocks, rows or columns, or if values are
    imputed before applying the model of the completely randomized
    design on block designs. } 
  \item{factor}{ A numeric (vector) to multiply on the estimated potency. } 
  \item{alpha}{ A real number, preferable between 0 and 1 - for the
    confidence interval. }
}
\details{
  See page 480 in Ph.Eur.
}
\value{
  A list of lists with variables named as at page 480 in Ph.Eur.
}
\references{
  Chapter 5.3. Statistical analysis.
  In EUROPEAN PHARMACOPOEIA version 8.0, 2014; 607-635.
  
  Fieller, E.C.: The biological standardization of insulin. Supplement to the
  Journal of the Royal Statistical Society. 1940; Vol. VII., No. 1.
}
\author{Jens Henrik Badsberg}
\keyword{ design }
