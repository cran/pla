\name{pla.fit}
\alias{pla.fit}

\alias{fit}

\alias{plaFit-class}
\alias{anova,plaFit-method}
\alias{coef,plaFit-method}
\alias{confint,plaFit-method}
\alias{fitted,plaFit-method}
\alias{lm.influence,plaFit-method}
\alias{plot,plaFit-method}
\alias{predict,plaFit-method}
\alias{print,plaFit-method}
\alias{residuals,plaFit-method}
\alias{summary,plaFit-method}
\alias{vcov,plaFit-method}

\title{Estimation in parallel line models, with listing of results}
\description{
  The main results are the estimate of potency with confidence
  interval and the anova table with tests of regression,
  parallelism and linearity. The anova table can also have test of
  effect of blocks for Randomized Block Design, and test of row and
  column for Latin Square Design.

  Further the restricted and unrestricted models are fitted without
  effects of row, columns, and blocks.
  
  The models are fitted by \link{lm},
  in combination with the function \link{pheur325}.

  Results are listed directly, or returned in an object.  These results
  can be typeset by \code{LaTex} - directly, or by the use of the
  package \code{xtable}.
}
\usage{
fit(object, ...) 
pla.fit(data,
        sampleLabels = levels(unlist(data["Sample"])),
        indexOfReference = 1,
        StdName = sampleLabels[indexOfReference],
        design = "blocks",
        dfAdj = 0,
        dr = 2,
        factor = 1,
        alpha = 0.05,
        main = "Parallel Line Model",
        tag = "PLA",
        expectedAnova = NULL,
        expectedPotency = NULL,
        formatTests = "long",
        show = FALSE,
        sink = FALSE,
        Sweave = FALSE,
        printPotencyEstimates = TRUE,
        returnPotencyEstimates = TRUE)
}

\arguments{
  \item{object}{ Object of class \link{pla-class}. }
  \item{...}{ Arguments from \code{tag} to \code{printPotencyEstimates}
    of \link{pla.fit}. The other arguments for \link{pla.fit} are
    extracted from the \code{object} when using \code{fit(object, ...)}.
  } 
  \item{data}{ The \link{data.frame} with relevant variables -
               created by \link{data2assayFrame} or \link{assayTable2frame}. }
  \item{main}{ A character string giving with the main \link{title} for
    \link{plot} (created by \link{pla.plots}). }
  \item{tag}{ A character string giving a part of names of
    output-files, see e.g. \code{sink}. } 
  \item{design}{ \code{crd}, \code{blocks}, or \code{latin} for selecting
    "Completely Randomized Design", "Randomized block design",
    or "Latin square design". }
  \item{dr}{ The dilution ratio of the equally spaced dilutions. }
  \item{dfAdj}{ The needed adjustment of the number of degrees of freedom,
    if data are corrected for blocks, rows or columns before applying
    the model of the completely randomized design on block designs,
    or if values are imputed. }
  \item{sampleLabels}{
    A vector of character strings giving the labels of the \code{samples}. 
    If \code{data["Sample"]} has one of these values, then these rows are used.
    These labels are also used for labels of the returned values.
    % The values of \code{Sample} for the \code{Standard} has to be
    % \code{S} regardless of these labels.
  }
  \item{indexOfReference}{ Index of the reference among the samples
    given by \code{sampleLabels}.
    %  The following is now not the case:
    %  This index is the levels of the factor \code{Sample} in the input
    %  data. Thus if the order of the labels \code{sampleLabels} does
    %  not match the order of the levels of he factor \code{Sample} of the
    %  input data, you will get unexpected results.
  }
  \item{StdName}{ A character string identifying the reference in the
    columns \code{Sample} of the input data \code{data}.
    If \code{data["Sample"]} has this
    value, then these rows are from the 'reference'.
  }
  \item{formatTests}{ A vector of character string, \code{"long"},
    \code{"short"}, \code{"both"}, \code{"none"} to select format for
    results of validity tests. }
  \item{show}{ A logical or subset of "head", "anova", "tests",
    "regressions", "ratios", "pheur", "rsquare", "slope",
    "logpotency", "potency").
    If \code{TRUE} then all the results are reported. }
  \item{sink}{ Output is diverted to 
     \code{paste(tag, "-Result.txt", sep = "")} if this boolean is
     \code{TRUE}. }
  \item{alpha}{ A numeric (vector), the level of significance for test of
    validity, default \code{0.05}. \code{alpha} can be a named vector
    with the levels of significance for the tests of \code{Regression},
    \code{Linearity}, \code{Parallelism}, and the complementary
    probability \code{alpha} of the \code{Confidence} interval of the
    potency. If more than one probability is supplied for one test of
    validity, then \code{"Unknown"} is reported for tests with
    probability between the supplied values, with counts of limits
    exceedded. 
   }
  \item{Sweave}{ If \code{TRUE} then code is inserted in the
    output listing for page breaking in LaTeX. }
  \item{factor}{ A numeric (vector) to multiply on the estimated potency. } 
  \item{expectedAnova}{ A numeric matrix with the expected ANOVA table. } 
  \item{expectedPotency}{ A numeric matrix with the expected potency. } 
  \item{printPotencyEstimates}{ If \code{TRUE} then computed potency
    values are listed (for Sweave). }
  \item{returnPotencyEstimates}{ If \code{TRUE} then computed potency
    values are returned. }
}
\value{No values returned.}
\author{Jens Henrik Badsberg}
\examples{
data(Turbidimetric); Data <- Turbidimetric

Design <- "blocks"
Data   <- readAssayTable(paste(system.file(package = "pla"),
                           "vignettes/PhEur/data/AntibioticTurbidimetric.txt",
                           sep = "/"))
Frame  <- as.data.frame(Data, dr = 1.5)

fits   <- pla.fit(Frame, design = Design, sampleLabels = c("S", "T"),
                  dr = 1.5, returnPotencyEstimates = TRUE)

## Alternative on object of class 'pla':

plaModel <- plaRBD(Data)
Fits <- fit(plaModel)
}
\keyword{ design }
