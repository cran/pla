\name{pla.plots}
\alias{pla.plots}
\title{Make plots for parallel line models}
\description{
  Plots of the "restricted" and "unrestricted" fits for parallel line
  models. Also plots of the model with individual fits for each
  combination of sample and dose can be displayed, on the scale
  of observed values, or corrected for the mean of the values for the
  dilution step. Finally residuals can be plotted in qq-plots (\link{qqnorm}),
  \link{hist}ograms, box-plots, or against dilutions step, sample, repetition,
  row, column, block, plate, etc.  
}
\usage{
pla.plots(dataframe,
          sampleLabels = levels(unlist(dataframe["Sample"])),
          indexOfReference = 1,
          design = "blocks",
          main = "Parallel Line Model",
          setPdf = FALSE,
          pdfName = "PlaPlots.pdf",
          nc = 4,
          mfrow = c(2, nc),
          oma = c(1, 0, 2, 0),
          mar = c(3.5, 3.5, 0, 0) + 0.6,
          joinReplicates = TRUE,
          showRho = FALSE,
          plots = "default",
          xlab = "Log(Dosis)",
          ylab = "Response: Response",
          pch = 14 + as.numeric(unlist(dataframe["Replicate"])),
          cex = 2,
          lwd = 4,
          colTst = "black",
          colRef = "grey",
          colRho = "grey10",
          colNrm = "grey70",
          tests = NULL)
}
\arguments{
  \item{dataframe}{ The \link{data.frame} with relevant variables,
    created by functions \link{data2assayFrame} or
    \link{assayTable2frame} - as for \link{pla.fit}. }
  \item{sampleLabels}{
    A vector of character strings giving the labels of the \code{samples},
    \code{standard} and \code{test-samples}: "S", "T", "U", ...
    If \code{data["Sample"]} has one of these values, then these rows are used.
    These labels are also used for labels of the returned values.
    % The values of \code{Sample} for the \code{Standard} should be
    % \code{S} regardless of these labels, and match a level of the
    % columns \code{Sample} og the input data \code{data}.
  }
  \item{indexOfReference}{ Index of the reference among the samples
    given by \code{sampleLabels}.
    %  The following is now not the case:
    %    This index is the levels of the factor \code{Sample} in the input
    %    data. Thus if the order of the labels \code{sampleLabels} does
    %    not match the order of the levels of he factor \code{Sample} of the
    %    input data, you will get unexpected results.
  }
  \item{design}{ \code{crd}, \code{blocks}, or \code{latin}, see \link{pla.fit}. }
  \item{main}{ Main \link{title} for \link{plot}. }
  \item{setPdf}{ If \code{TRUE} then PDF graphics is produced in
    \code{pdfName}. This should not be used for \code{Sweave}. }
  \item{pdfName}{ A character string giving the name of the file for PDF
  graphics. }
  \item{nc}{ \code{4} or \code{3}. Numeric value used for \code{mfrow}.
    One plot for the unrestricted model and the histogram of residuals
    omitted by \code{3}. } 
  \item{mfrow}{ See \link{par}. }
  \item{oma}{ See \link{par}. }
  \item{mar}{ See \link{par}. }
  \item{joinReplicates}{ See \link{plotSamples}. }
  \item{showRho}{ See \link{plotSamples}. }
  \item{plots}{ A (vector of) character strings from the list
    "default", "all", "restricted", "unrestricted", "twoway",
    "stepadjusted", "qplot", "histogram", "residualsSamples",
    "residualsBoxSampleStep", "residualsBoxSample",
    "residualsRow", "residuals-Column", "residualsBlock",
    "residualsPlate", "residualsStep". }
  \item{xlab}{ See \link{plotSamples}. }
  \item{ylab}{ See \link{plotSamples}. }
  \item{pch}{ See \link{plotSamples}. }
  \item{cex}{ See \link{plotSamples}. }
  \item{lwd}{ See \link{plotSamples}. }
  \item{colTst}{ Color(s) of \code{test-samples}, "T", "U", ... }
  \item{colRef}{ Color of \code{reference} or \code{standard}, i.e. "S". }
  \item{colRho}{ Color of displayed potency. }
  \item{colNrm}{ Color for \link{qqnorm} and \link{curve} in \link{hist}ogram. }
  \item{tests}{ Optional returned values from \link{pla.fit}. }
}
\value{No values returned.}
\author{Jens Henrik Badsberg}
\examples{
data(HepatitisB); Data <- HepatitisB

Design <- "crd"
Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/PhEur/data/HepatitisB.txt",
                             sep = "/"))
Frame  <- as.data.frame(Data)

fits   <- pla.fit(Frame, design = Design, sampleLabels = c("S", "T", "U", "V"), 
                  dr = 2.25, returnPotencyEstimates = TRUE)

cbbPalette <- c("#000000", "#009E73", "#e79f00", "#9ad0f3",
                "#0072B2", "#D55E00", "#CC79A7", "#F0E442")

plots <- pla.plots(Frame, sampleLabels = c("S", "T", "U", "V"),
                   nc = 3, showRho = FALSE, colTst = cbbPalette[2:4],
                   ## main = Data@assayTitle,
                   main = "PhEur: HepatitisB; Three hepatitis B vaccines against a standard",
                   tests = fits@tests)

## Alternative on object of class 'pla':

plaModel <- plaCRD(Data,
  assayTitle = "PhEur: HepatitisB; Three hepatitis B vaccines against a standard")
print(plaModel, formatTest = "short")
plots    <- plot(plaModel)
}
\keyword{ design }
