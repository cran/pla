\name{Erythropoietin}
\alias{Erythropoietin}
\docType{data}
\title{Erythropoietin rDNA - Normocythaemic assay in mice}
\description{
  Example 02 - Three-dose parallel line assay; randomized block;
  explicit content notation,
  from CombiStats - EDQM, Council of Europe (\url{http://combistats.edqm.eu}).
}
% Data class C
\usage{data("Erythropoietin")}
% \format{Similar to \link{Erythromycin}.}
\source{
  From CombiStats - EDQM, Council of Europe:
  \url{http://combistats.edqm.eu/images/stories/Examples/Erythropoeitin\%20rDNA.pdf}
}
\examples{
Example  <- "Example 2"
data(Erythropoietin); Data <- Erythropoietin

Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/CombiStat/data/Erythropoietin.txt",
                             sep = "/"),
                       rows = "Block", columns = "Dilutions & Samples")
plaModel <- plaCRD(Data); plaModel
plots    <- plot(plaModel, plots = "all", mfrow = c(3, 4))

# A few plots you cannot ask for in 'pla.plots' and 'plot':

cbbPalette <- c("#000000", "#009E73", "#e79f00", "#9ad0f3",
                "#0072B2", "#D55E00", "#CC79A7", "#F0E442")

pchs <- 14 + as.numeric(plots$data[, "Replicate"])
colors <- c("grey", "blue", "red")[as.numeric(plots$data[, "Sample"])]
colors <- colors <- c("grey", cbbPalette[2:3])[as.numeric(plots$data[, "Sample"])]

plot(Residual ~ factor(plots$data[, "Replicate"]), pch = pchs, col = colors,
     xlab = "Block", ylab = "Residuals, Restricted model", 
     cex.lab = 0.75, sub = "Restricted Model", data = plots$data)

plot(Residual ~ factor(Z), pch = pchs, col = colors,
     xlab = "log(Dosis)", ylab = "Residuals, Restricted model", 
     cex.lab = 0.75, sub = "Restricted Model", data = plots$data)

}
\keyword{datasets}
