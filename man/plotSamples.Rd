\name{plotSamples}
\alias{plotSamples}
\alias{plotMoreSamples}
\alias{plotTwoSamples}
\title{Scatter plot for parallel line models}
\description{
  Make one scatter plot of the samples in a parallel line assay, with fitted models.}
\usage{
plotSamples(dataframe,
            LMfits,
            sampleLabels = levels(unlist(dataframe["Sample"])),
            indexOfReference = 1,
            pdfName = "SpecifiedModel.pdf",
            joinReplicates = TRUE,
            showRho = TRUE,
            xlab = "Log(Dosis)",
            ylab = "Response: Response",
            pch = 14 + as.numeric(unlist(dataframe["Replicate"])),
            cex = 2,
            lwd = 4,
            colTst = "black",
            colRef = "grey",
            colRho = "grey80",
            main = "Parallel Line Model",
            sub = "Specified Model")
}
\arguments{
  \item{dataframe}{ The \link{data.frame} with relevant variables
    (\code{Replicate}, \code{Response}, \code{indexOfTreatment},
    \code{Z}, and \code{Zjitter}),
    created by \link{jitterSteps} in \link{pla.plots}. } 
  \item{LMfits}{ Result of \link{lm} with relevant regression
    coefficients. Fitted values, intercepts and slopes are extracted
    from this model. }
% \item{LMextended}{ Result of \link{lm} with relevant regression coefficients. }
  \item{sampleLabels}{ See \link{pla.plots}. }
  \item{indexOfReference}{ See \link{pla.plots}. }
  \item{pdfName}{ See \link{pla.plots}. }
  \item{joinReplicates}{ If \code{TRUE} the samples from same block or row
    are joined by lines in the plots for unrestricted models,
    i.e. for the models with dilution as a factor. }
  \item{showRho}{ If \code{TRUE} then the potency is displayed in the
    plot for the restricted model. }
  \item{xlab}{ A character string giving the \link{title} on horizontal
    axis of the \link{plot}. } 
  \item{ylab}{ A character string giving the \link{title} on vertical
    axis of the \link{plot}. } 
  \item{pch}{ Vector of symbols for \link{plot}, \link{par}. }
  \item{cex}{ See \link{par} about size of characters for \link{plot}. }
  \item{lwd}{ See \link{par} about line width for \link{plot}. }
  \item{colTst}{ See \link{pla.plots}. }
  \item{colRef}{ See \link{pla.plots}. }
  \item{colRho}{ See \link{pla.plots}. }
  \item{main}{ See \link{pla.plots}. }
  \item{sub}{ See \link{pla.plots}. }
}
\details{ This function is called from \link{pla.plots}.}
\value{No values returned.}
\author{Jens Henrik Badsberg}
\keyword{ hplot }
