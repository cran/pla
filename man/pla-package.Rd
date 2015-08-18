\name{pla-package}
\alias{pla-package}

\docType{package}
\title{Parallel Line Assays}
\description{
  Parallel Line Models:

  Completely Randomized Design,
  Randomized Block Design, and Latin Squares Design.

  Balanced data are fitted as described in the Ph.Eur.

  In the presence of missing values complete data analysis can be
  performed (with computation of Fieller's confidence intervals for
  the estimated potency), or imputation of values can be applied.

  The package contains a script such that a \code{pdf}-document with a
  report of an analysis of an assay can be produced from an input file
  with data of the assay just by entering the name of the input-file.
  Here no knowledge of R is needed by the user.
  This tool requires \code{R} and \code{Tex}
  (e.g. \code{MikTex}) to be installed.
  The \code{.BAT}- and \code{.csh}-files for this is found in
  \code{.../pla/scripts/} of your installed \link{pla} package.
  You can of course modify the "skeleton"
  (\code{.../pla/scripts/Skeleton/Skeleton-xtable.Rnw})
  \code{Sweave} program of this script.
  You should not (only) place your data in \code{.../pla/scripts/data},
  but copy the content of the directory \code{.../pla/scripts/} to some
  place not effected by updates of \code{R} and the \link{pla-package}.
}
\details{
  \tabular{ll}{
    Package: \tab pla\cr
    Type: \tab Package\cr
    Version: \tab 0.1\cr
    Date: \tab 2015-08-18\cr
    License: \tab GPL (>= 2)\cr
  }

  Contents:

  \itemize{
    \item \link{readAssayTable}: Reads (\code{.txt}) files with
    responses of assays, entered as matrices with rows of measurements
    by columns of factors and variables, or entered as tables (arrays)
    of responses. The result has methods \link{as.data.frame},
    \link{as.array}, and \link{as.table}.
    % Many examples of input data are found in the folder
    % \code{.../pla/vignettes/'Source'/data/}.
    \itemize{
    \item \link{assayTable2frame}: An \link{array} with the responses of
    an assay is transformed to a \link{data.frame} for \link{pla.fit} and
    \link{pla.plots}. 
    \item \link{data2assayFrame}: Check and prepare a \link{data.frame} for
    \link{pla.fit} and \link{pla.plots}.  
    }
    \item \link{pla}: Functions for defining and creating parallel line
    assay models. Imputation of missing values is performed, as an option.
    \item \link{pla.fit} or \link{fit} on pla-model: Estimation in
    parallel line models, with listing of results. 
    \itemize{
    \item \link{pheur325}: Estimation of potency and confidence limits
    as described at page 480 in the Ph.Eur. 
    }
    \item \link{pla.plots} or \link{plot} on pla-model: Make plots for
    parallel line models. 
    \itemize{
    \item \link{plotSamples}: One scatter plot for parallel line models.
    \item \link{jitterSteps}: Compute a perturbed version of the
    concentration-variable. 
    }
  }

  The two main functions are \link{pla.fit} and \link{pla.plots},
  which expects data in the format as returned by
  \link{assayTable2frame} or \link{data2assayFrame}.
  But the function \link{readAssayTable} is also very useful.

  One way to understand (and to reproduce) the structure of the expected
  input of \link{pla.fit} and \link{pla.plots} is to look into
  \link{data2assayFrame}.
  The column names \code{Response}, \code{Dilution}, \code{Sample},
  \code{Replicate}, \code{Row}, and \code{Column} of the input for
  \link{data2assayFrame} cannot be changed. 
  \code{Row} and \code{Column} are used for \code{"Latin squares"}.

  \code{Replicate} is used for \code{"blocks"} and completely random
  designs.

  % For examples on \link{assayTable2frame} in combination with
  % \link{readAssayTable}, navigate to the folder \code{.../inst/}
  % of the \link{pla}-package or \code{.../pla/scripts/data/} of your
  % installed package.
  % Here you will find the \code{.txt}-files read by
  % \link{readAssayTable} - for the \code{"Sweave"} source code.

  \link{pheur325} is designed to be called from \link{pla.fit}, and
  \link{plotSamples} is designed to be called from \link{pla.plots}.

  The input dataframe for \link{pla.plots} and \link{pla.fit} should be
  ordered by \code{Sample} and \code{"DilutionStep"}.

  The output listing is designed for "R CMD Sweave" and "pdflatex".

}
\author{Jens Henrik Badsberg <pla2015@badsberg.eu>}
\references{
  Ph.Eur.: Chapter 5.3. Statistical analysis.
  In EUROPEAN PHARMACOPOEIA 5.0, 2004; 475-504.

  Coward, Katrine Hope, Kassner, Elsie Woodward (1941):
  A Comparison between Interlitter and Intralitter variation in rats
  with respect to the healing of rachitic bones by vitamin D.
  Pharmaceutical Society, London.
  
  Fieller, E.C.: The biological standardization of insulin. Supplement to the
  Journal of the Royal Statistical Society. 1940; Vol. VII., No. 1.
  
  Bliss, C.I. (1952):
  The Statistics of Bioassay - with special reference to the vitamin.
  Academic Press, New York.

  Arthur Linder, Genova, Switzerland (1964):
  Statistics of Bioassays,
  Notes on lectures held during the spring semester (1964)
  at the Statistics Department, University of North Carolina, Chapel Hill, N. C.

  Finney, David J. (1978): Statistical Method in Biological Assay.
  Charles Griffin & Company Ltd. Third Edition.
}
\keyword{ package }
