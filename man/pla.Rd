\name{assayModel-class}

\alias{assayModel-class}

\alias{pla}
\alias{plaCRD}
\alias{plaLSD}
\alias{plaRBD}


\alias{pla-class}
\alias{plaCRD-class}
\alias{plaLSD-class}
\alias{plaRBD-class}

% \alias{anova-methods}
% \alias{coef-methods}
% \alias{confint-methods}
% \alias{fitted-methods}
% \alias{lm.influence-methods}
% \alias{plot-methods}
% \alias{predict-methods}
% \alias{print-methods}
% \alias{residuals-methods}
% \alias{summary-methods}
% \alias{vcov-methods}

% \alias{anova,ANY-method}
% \alias{coef,ANY-method}
% \alias{confint,ANY-method}
% \alias{fitted,ANY-method}
% \alias{lm.influence,ANY-method}
% \alias{plot,ANY-method}
% \alias{predict,ANY-method}
% \alias{print,ANY-method}
% \alias{residuals,ANY-method}
% \alias{summary,ANY-method}
% \alias{vcov,ANY-method}

\alias{anova,pla-method}
\alias{coef,pla-method}
\alias{confint,pla-method}
\alias{fitted,pla-method}
\alias{lm.influence,pla-method}
\alias{plot,pla-method}
\alias{predict,pla-method}
\alias{print,pla-method}
\alias{residuals,pla-method}
\alias{summary,pla-method}
\alias{vcov,pla-method}
\alias{as.data.frame,pla-method}

\title{ Create a parallel line assay model }
\description{ Create a parallel line assay model, with optional imputation of data. }
\usage{
pla(data,
    alpha            = 0.05,
    indexOfReference = 1,
    StdName          = sampleLabels[indexOfReference],
    sampleLabels     = "data",
    imputeMissing    = FALSE,
    dfAdjustment     = NA, 
    dilutionRatio    = NA,
    factor           = NA,
    selectFun        = function (array) NULL,
    echoData         = TRUE,
    colors           = "default",
    projectTitle     = "",
    assayTitle       = "",
    design           = "", ...)
plaCRD(data, alpha = 0.05, imputeMissing = FALSE, dfAdjustment = NA,
    dilutionRatio = NA, factor = NA, echoData = TRUE,
    colors = "default", projectTitle = "", assayTitle = "")
plaRBD(data, alpha = 0.05, imputeMissing = FALSE, dfAdjustment = NA,
    dilutionRatio = NA, factor = NA, echoData = TRUE,
    colors = "default", projectTitle = "", assayTitle = "")
plaLSD(data, alpha = 0.05, imputeMissing = FALSE, dfAdjustment = NA,
    dilutionRatio = NA, factor = NA, echoData = TRUE,
    colors = "default", projectTitle = "", assayTitle = "")
}
\arguments{
  \item{data}{
    An object of class \link{assayData-class}
    (returned from \link{readAssayTable})
    or a \link{data.frame} as returned from \link{data2assayFrame} or
    \link{assayTable2frame}. 
  }
  \item{sampleLabels}{
    A vector of character strings giving the labels of the
    \code{samples}. By default, \code{"data"}, the labels are extracted
    from the data.  If the resulting column \code{"Sample"} from
    \code{data} has one of these values, then these rows are used in
    fits and plots.
  }
  \item{indexOfReference}{ Index of the reference among the samples
    given by \code{sampleLabels}.
  }
  \item{StdName}{ A character string identifying the reference
    among the \code{Samples} of the input data \code{data}.
    By default, this is \code{sampleLabels[indexOfReference]}.
  }
  \item{imputeMissing}{ A boolean. If \code{TRUE} then imputation is
    used for missing values. } 
  \item{alpha}{ A numeric, the level of significance for test of
    validity, and also used for confidence intervals, default
    \code{0.05}. See \link{pla.fit}. }
  \item{dfAdjustment}{ The needed adjustment of the number of degrees of freedom,
    if e.g. data are corrected for blocks, rows or columns before applying
    the model of the completely randomized design on block designs. }
  \item{dilutionRatio}{ The dilution ratio of the "equally spaced" dilutions. }
  \item{factor}{ A numeric to multiply on the estimated potency. } 
  \item{selectFun}{ A \link{function} taking as argument the array of
    all read factors, and returning the three-dimensional array of the
    model. Factors and dimensions can be deleted, or treatments (samples
    and/or doses) selected.
  }
  \item{echoData}{ A boolean.  If \code{TRUE} then the data table is
    printed. } 
  \item{colors}{ A vector of text strings for the colors of preparations. }
  \item{projectTitle}{ A character string. }
  \item{assayTitle}{ A character string. }
  \item{design}{
    "crd", "rbd" or "lsd" for respectively "completely randomized design",
    "randomized block design", and "latin squares design". }
  \item{...}{ Arguments for \code{impute}: \code{epsilon},
    \code{maxit}, and \code{trace}. }
  % \item{class}{ "plaCRD", "plaRBD" or "plaLSD". }
}
\details{
  \link{assayTable2frame} and \link{data2assayFrame}
  returns an object of class \link{data.frame}.
  \link{readAssayTable} returns an object of class
  \link{assayFrame-class} or \link{assayTable-class},
  which both also are of (contains) class \link{assayData-class}.
  
  Objects of classes \link{assayData-class} and \link{data.frame}
  are turned into models by the functions \link{plaCRD}, \link{plaRBD},
  and \link{plaLSD} for respectively completely randomized design,
  randomized block design, and latin squares design. 

  % These functions accepts the \link{data.frame} of
  % \link{assayTable2frame} and \link{data2assayFrame}.

  The functions \link{print}, \link{show}, \link{plot}, and \link{fit}
  are available for returned objects of class \link{pla-class} of these
  functions.
  The returned object of \link{fit} has the usual methods of \link{lm}
  plus the function \link{potency}.

  \link{pla} (also called by \link{plaCRD}, \link{plaRBD}, and
  \link{plaLSD}) does the job of checking the input data, and adding
  necessary variables for \link{pla.fit} and \link{pla.plots}.
  The model is specified by the \code{design} argument, or slot
  of the argument data object. Similar for \code{dfAdjustment},
  \code{factor}, and \code{dilutionRatio}. The preference here is
  that if the argument is given to \code{pla}, the value of this
  argument is used. 
  Else, if the value is found in the argument object \code{data}, that
  value is used. If the argument is not given, and the value neither is
  found in the argument object with data, then a default value, "crd", 0
  or 1, is used. Also the significance level, and default colors and
  titles for plots are set. 
  
  Last but not least, imputation of data is performed in \link{pla},
  if this is wanted, by setting \code{imputeMissing} to \code{TRUE}.
  Thus the imputed data in the resulting object can be inspected before
  the model is fitted, and the imputation is performed separated from
  the reading the data.
  The imputation is performed as described in Ph.Eur. (EUROPEAN
  PHARMACOPOEIA). See also Bliss (1952). 
  
}
\note{
  \link{data2assayFrame} is called from \link{pla}, if a
  \link{data.frame} is found as the argument, or as the
  relevant slot in an argument with this slot. 
 }
\value{ Object of class \link{pla-class}, \link{plaCRD-class},
  \link{plaLSD-class}, or \link{plaRBD-class}. }
\author{ Jens Henrik Badsberg }
\references{
  Chapter 5.3. Statistical analysis.
  In EUROPEAN PHARMACOPOEIA version 8.0, 2014; 607-635.
  
  Bliss, C.I. (1952):
  The Statistics of Bioassay - with special reference to the vitamin.
  Academic Press, New York.
}
\seealso{\link{pla-package}}
\keyword{ method }
