\name{data2assayFrame}
\alias{data2assayFrame}
\title{Check dataframe for \link{pla.fit}}
\description{
  Check and prepare a \code{dataframe} with data for \link{pla},
  \link{pla.fit}, and \link{pla.plots}.
}
\usage{
data2assayFrame(dataframe,
                dr = 1.5,
                Z = log((1/dr)^(max(Dilution) - Dilution)),
                design = "lsd")
}
\arguments{
  \item{dataframe}{ 
    \code{dataframe} with the columns \code{Response}, \code{Dilution},
    \code{Sample}, and \code{Replicate} (or \code{Row} and \code{Column}).
  }
  \item{dr}{ The dilution ratio of the geometric dilution serie with
    equally spaced dilutions (constant ratio between any adjacent
    dilutions) on the logarithmic scale. } 
  \item{Z}{ The 'concentration', by default computed as
    \eqn{log((1/dr)^{(max(Dilution) - Dilution)})}, where \code{Dilution}
    is a columns of the argument \code{dataframe}. }
  \item{design}{ If "lsd", then \code{Row} and \code{Column}
    has to be columns of the \code{dataframe}, and
    a column \code{Replicate} is copied from \code{Row}.
    \code{Replicate} and \code{Row} is also used for
    \code{'block'} and \code{'plate'}. 
    \code{Column} is for "lsd" ("Latin Square Design")
    used for the 'other' factor.
    For the designs "crd" and "rbd" \code{Replicate}
    has to be a column of the argument \code{dataframe}.
  }
}
\details{
  This function is used internally in \link{pla} to check the
  \code{dataframe} that can be given with the data for \link{pla.fit}.
  It can also be used to prepare a dataframe for direct call of
  \link{pla.fit}. 
  Relevant columns are added for \link{pla.fit},
  and the \code{dataframe} is sorted for \link{pla.plots}.
}
\note{
  The \code{slope} for the \link{potency}
  is computed relative to the added column \code{Z} for complete data
  analysis.
  \code{Z} is NOT used when computing the \link{potency}
  for data without missing values by the method of Ph.Eur.

  The dilution ratio \code{dr} is also used in the function
  \link{pheur325} for computing the slope and potency (when
  the design is complete, i.e. there are no missing values).
  Thus if a geometric dilution serie not is used, the anova-table
  and plots might be useful, but not the slope and potency
  computed by \link{pheur325} and thus by \link{pla.fit}.  

  \code{Sample} and \code{Step} are transformed to \link{numeric}s
  from possible \link{factor}s (with the orderings of the levels of
  these factors), and the order of \code{Sample} and \code{Step} are
  then reverted. This might give some confusion. \link{data2assayFrame}
  is called from \link{pla}, if a \link{data.frame} is found as the
  argument, or as the relevant slot in an argument with this slot.
  Use \link{as.data.frame} on the \link{pla}-object to view data data
  as going into the fitting and plotting functions - for debugging. 
}
\value{
  A \link{data.frame}.
}
\author{Jens Henrik Badsberg}
\examples{

# Example 1:

require(graphics)
Dilution  <- 2 + log(ToothGrowth["dose"]) / log(2)
names(Dilution) <- "Dilution"
Replicate <- rep(1:10, 6)
Data      <- cbind(ToothGrowth, Replicate, Dilution)
dimnames(Data)[[2]] <- c("Response", "Sample", "Dose", "Replicate", "Dilution")
Design    <- "crd"
Frame     <- data2assayFrame(Data, dr = 2, design = Design)
Fits      <- pla.fit(Frame, sampleLabels = c("VC", "OJ"), dr = 2,
                     design = Design, main = "ToothGrowth", show = TRUE)
pla.plots(Frame, design = Design,
          sampleLabels = c("VC", "OJ"), main = "ToothGrowth")

# Example 2:

data(AgarDiffusionAssay)

# Agar   <- read.table("./pla/vignettes/PhEur/data/AntibioticAgarDiffusionAssay.txt",
#                      header = TRUE)
Agar     <- AgarDiffusionAssay
Design   <- "lsd"
select   <- c("Row", "Column", "Sample", "Dilution", "Response")
Frame    <- data2assayFrame(Agar[, select])

fits   <- pla.fit(Frame, design = Design, sampleLabels = c("S", "T"),
                  dr = 1.5, returnPotencyEstimates = TRUE)

## Alternative on object of class 'pla':

plaModel <- plaLSD(Agar)
Fits <- fit(plaModel)
}
\keyword{ mich }
