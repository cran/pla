\name{Corticotrophin}
\alias{Corticotrophin}
\docType{data}
\title{An assay of corticotrophin by subcutaneous injection in rats}
\description{5.1.1. TWO-DOSE MULTIPLE ASSAY WITH COMPLETELY RANDOMIZED DESIGN}
\usage{data("Corticotrophin")}
% Data class B
\details{
  From Ph.Eur.:
  
  The standard preparation is administered at 0.25 and 1.0 unit
  per 100 g of body mass. 2 preparations to be examined are
  both assumed to have a potency of 1 unit per milligram and
  they are administered in the same quantities as the standard.
  The individual responses and means per treatment are given
  in Table 5.1.1.-I. A graphical presentation (Figure 5.1.1.I)
  gives no rise to doubt the homogeneity of variance and
  normality of the data, but suggests problems with parallelism
  for preparation U.
}
\source{
  % \url{http://lib.njutcm.edu.cn/yaodian/ep/EP5.0/05_general_texts/5.3.__statistical_analysis_of_results_of_biological_assays_and_tests/}
  The example can also be found at CombiStats - EDQM, Council of Europe
  (\url{http://combistats.edqm.eu}):
  \url{http://combistats.edqm.eu/content/view/186/199/}
}
\references{
  Chapter 5.3. Statistical analysis.
  In EUROPEAN PHARMACOPOEIA version 8.0, 2014; 607-635.
}
\examples{
data(Corticotrophin); Data <- Corticotrophin

Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/PhEur/data/Corticotrophin.txt",
                             sep = "/"))
plaModel <- plaCRD(Data,
                   assayTitle =
                "PhEur: Corticotrophin; Subcutaneous Injection In Rats")
plaModel
plots    <- plot(plaModel, plots = "all", mfrow = c(3, 4))

# A few plots you cannot ask for in 'pla.plots' and 'plot':

cbbPalette <- c("#000000", "#009E73", "#e79f00", "#9ad0f3",
                "#0072B2", "#D55E00", "#CC79A7", "#F0E442")

pchs <- 14 + as.numeric(plots$data[,"Replicate"])
colors <- c("grey", "blue", "red")[as.numeric(plots$data[, "Sample"])]
colors <- colors <- c("grey", cbbPalette[2:3])[as.numeric(plots$data[, "Sample"])]

# Boxplot af residuals by replicate:
plot(Residual ~ factor(plots$data[,"Replicate"]), pch = pchs, col = colors,
     xlab = "Replicate", ylab = "Residuals, Restricted model", 
     cex.lab = 0.75, sub = "Restricted Model", data = plots$data)

# Boxplot of residuals by dose:
plot(Residual ~ factor(Z), pch = pchs, col = colors,
     xlab = "Dose", ylab = "Residuals, Restricted model", 
     cex.lab = 0.75, sub = "Restricted Model", data = plots$data)

}
\keyword{datasets}
