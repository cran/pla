\name{readAssayTable}
\alias{readAssayTable}

\alias{assayData-class}
\alias{assayTable-class}
\alias{assayFrame-class}

\alias{print,assayFrame-method}
\alias{print,assayTable-method}
\alias{show,assayFrame-method}
\alias{show,assayTable-method}
\alias{as.table,assayFrame-method}
\alias{as.table,assayTable-method}
\alias{as.array,assayFrame-method}
\alias{as.array,assayTable-method}
\alias{as.array,data.frame-method}
\alias{as.data.frame,assayFrame-method}
\alias{as.data.frame,assayTable-method}

\title{Read a .txt file with responses of an assay}
\description{
  Read ".txt" file with responses of an indirect
  dilution assay, with some titles and labels -
  and return the table and labels in an object.

  The function reads either a matrix of measurement by variable (a
  'data.frame'), or a table with the measured variable (an 'array').
  
}
\usage{
readAssayTable(file = "AssayTable.txt",
               fun = NULL, 
               log = FALSE, 
               rows = "", 
               columns = "",
               replicateNames = c("Repetition", "Replicate", "Block",
                   "Plate", "Animal", "Group", "Litter"),
               doseNames = c("Dilution", "Dose"),
               sampleNames = c("Smp", "Sample"),
               otherNames = c("Outer", "Inner", "Assay"),
               responseName = "Response",
               combinedTreatment = FALSE,
               echoTitle = TRUE)
}
\arguments{
  \item{file}{ A character string giving the name of the file of input. }
  \item{fun}{ A function to be applied on the table
    (before log-transformation). }
  \item{log}{ If \code{TRUE}, then the responses are log-transformed. }
  \item{rows}{ A character string: A warning is given, if this does not
    match the row-factors found in the file. }
  \item{columns}{ A character string: A warning is given, if this does not
    match the column-factors found in the file. }
  \item{replicateNames}{ A vector of text strings with permitted names
    for the factor of replicates. These cannot be used for labels
    of levels in the header line, the first line of the file. }
  \item{doseNames}{ A vector of text strings with permitted names
    for the factor of doses. }
  \item{sampleNames}{ A vector of text strings with permitted names
    for the factor of samples. }
  \item{otherNames}{ A vector of text strings with permitted names
    of other factors. }
  \item{responseName}{ A text string with name of response. }
  \item{combinedTreatment}{ A boolean.
    If \code{TRUE} then the dose and sample
    does not have to be balanced.
    Dose and sample is read as a combined treatment,
    when they are given in columns, that is,
    the levels are specified in the header line. }
  \item{echoTitle}{ A boolean. If \code{TRUE} then the project- and
    assay-title is printed. }
}
\details{The file is read by \link{read.table}.

  % Navigate to the folder \code{.../pla/vignettes/'Source'/data/}
  % or \code{.../pla/scripts/data/} to see some examples of data-files.
  The file \code{.../pla/scripts/data/AssayTable.txt} shows a very
  simple example without \code{"comments"} for project- and assay-title,
  design, etc.


  If the function finds the text-string 'response' in the header line of
  the file, then the returned object is of class \link{assayFrame-class},
  else a table with the measured variable (an 'array') is expected, and
  then the values are stored an object of class \link{assayTable-class}.

  Her are some examples of the later:
  
  1. form: Columns identified by the cross classification
  of sample and dose, and rows identified by
  replicate-, repetition-, plate-, or block-number.

  For data entered as this table for the measurements, the header line,
  first record or row, of the file gives the names of the treatments
  (samples and dilution-steps) together with the name of at least one
  factor variating over the rows.

  Columns should then contain the replicates of responses for the
  individual treatments (cross classification of samples and
  dilution-steps), rows of the file the responses for different
  samples and doses for one replicate (plate or block).
  The first column is a label for the "replicate", "block", "plate", ...,

  When the columns contains the responses for the individual treatments
  (cross classification of samples and dilution-steps), and rows of the
  file replicates of the response, \code{samples} are named by a single
  letter ("S", "T", "U", ...) and dilution steps by a single digit,
  and the header thus are text strings with two characters,
  ("S1", "S2", ..., "T1", "T2", ...) - then everything is very simple.

  But sometimes the cross classification of samples and dilution-steps
  have to be divided on more lines, or the replicates entered in the
  individual lines determined by the doses of the samples, e.g. to make
  proofreading against the source more easy. 
  But then the programming in this package is not so simple (though only
  a few 'hacks' are necessary), but especially this documentation gets
  complicated: 
  
  A column with label \code{sample} can be used when samples (for one
  'replicate') requires more lines. 
  This is used for the "2. alternative" below.
  The table can also be transposed (transformed) relative to the above
  "1. form", if rows contains the replicates of one treatment, i.e. one
  cross-classification of sample and dose, and columns the responses for
  the individual replicate numbers.
  A column \code{Dose} and a column \code{Sample} is then used for naming
  \code{treatments}.

  1. alternative: Rows identified by the cross classification of sample
  and dose, and columns identified by replicate-, repetition-, plate-,
  or block-number: 

  If the keyword \code{"Dose"} is used in the first column (together with
  a dose or step number) and a column is used to identify
  \code{"sample"}, then the lines are expected to have the replicates
  for the cross-classification of dose and sample determined by the
  these two columns.

  This table is just a transposed version of the above "1. form".
  
  2. alternative: Rows identified by the cross classification of sample
  and replicate-, repetition-, plate-, or block-number and columns
  identified by dose:

  This is similar to the above "1. form", but the lines are just too
  long, and thus divided by sample.
  Here also a column with name \code{sample} gives the \code{sample}.

  For the 1. and 2. alternative, the order of the dilution steps are
  determined by the order of the columns (by \link{assayTable2frame}
  when \code{byOrder} is \code{TRUE}, the default). 
  Please note that the labels of the dilution steps are then ignored.


%  By two of the keywords \code{sample}, \code{dose}, \code{replicate},
%  \code{block}, \code{plate}, \code{repetition}, ..., (and
%  \code{Response} not found) in the header it should be possible to
%  select on of the six forms.
  
  These three above alternatives covers half of the six possibilities of the
  layout of the table of responses: Three cases with columns determined
  by one of the tree factors \code{sample}, \code{dose} and
  \code{replicate} (\code{block} , \code{plate}, \code{repetition},
  ...), and three cases with the columns determined by the cross
  classification of two of the three factors.

  The first found word of the header gives one of one or more factors
  determination the rows. This word should also be a part of the first
  word of the rows of the table (to separate the data-table from the
  from the options).
  Other names in the header not found in the \code{'Names'} arguments
  determinate the remaining factors and there levels, and are column
  names of columns with responses.

  Other interesting tested examples of headers are:  
    \itemize{
      % \item Replicate D1 D2 D3 D4 D5 Sample
     % \item Dose R1 R2 Sample Label
     % \item Plate S1 S2 T1 T2 U1 U2 Label
      % \item Block S1 S2 S3 S4 T1 T2 T3 T4 Label
     % \item Animal S1 S2 S3 T1 T2 T3 U1 U2 U3 Label
      % \item Dose R1 R2 R3 R4 Sample
      % \item Dose R-1:I-y R-1:I-z R-2:I-y R-2:I-z Sample
      % \item D Smp R-1 R-2 R-3 R-4 R-5 R-6 Label
      % \item Sample D R-1 R-2 R-3 R-4 R-5 R-6 Label      
      % \item Sample R D-3 D-2 D-1 Label
      % \item R S D-3 D-2 D-1 Label
      % \item R Dose R S Label
      % \item D R T S Label
      \item Block BRP_Batch:1 BRP_Batch:2 BRP_Batch:3 Test:1 Test:2 Test:3 Label
      \item Replicate D-1.00:T D-0.10:T D-0.01:T D-1.00:S D-0.10:S D-0.01:S Label
      \item Replicate T:Dose-3 S:Dose-3 T:Dose-2 S:Dose-2 T:Dose-1 S:Dose-1 Label
      \item Replicate S:D=5.76 S:D=9.6 S:D=16.0 T:D=32.4 T:D=54.0 T:D=90.0 T:D=150.0 Label

      % \item[DRS-narrow-A] D R T S Label
      % \item[DRS-narrow-B] R D T S Label
      % \item[DRS-narrow-C] Dose Replicate T S Label
      % \item[DRS-narrow-D] Replicate Dose T S Label
      % \item[DSR-narrow-A] D Smp R-1 R-2 R-3 R-4 R-5 R-6 Label
      % \item[DSR-narrow-B] Sample D R-1 R-2 R-3 R-4 R-5 R-6 Label
      % \item[DSR-narrow-C] Dose Sample Replicate-1 Replicate-2 Replicate-3 Replicate-4 Replicate-5 Replicate-6 Label
      % \item[DSR-narrow-D] Sample Dose Replicate-1 Replicate-2 Replicate-3 Replicate-4 Replicate-5 Replicate-6 Label
      % \item[RDS-narrow-A] R Dose R S Label
      % \item[RDS-narrow-B] D R T S Label
      % \item[RDS-narrow-C] Replicate Dose T S Label
      % \item[RDS-narrow-D] Dose Replicate T S Label
      % \item[RSD-narrow-A] R S D-3 D-2 D-1 Label
      % \item[RSD-narrow-B] Sample R D-3 D-2 D-1 Label
      % \item[RSD-narrow-C] Replicate Sample Dose-3 Dose-2 Dose-1 Label
      % \item[RSD-narrow-D] Sample Replicate Dose-3 Dose-2 Dose-1 Label
      % \item[SDR-narrow-A] Sample D R-1 R-2 R-3 R-4 R-5 R-6 Label
      % \item[SDR-narrow-B] D Smp R-1 R-2 R-3 R-4 R-5 R-6 Label
      % \item[SDR-narrow-C] Sample Dose Replicate-1 Replicate-2 Replicate-3 Replicate-4 Replicate-5 Replicate-6 Label
      % \item[SDR-narrow-D] Dose Sample Replicate-1 Replicate-2 Replicate-3 Replicate-4 Replicate-5 Replicate-6 Label
      % \item[SRD-narrow-A] Sample R D-3 D-2 D-1 Label
      % \item[SRD-narrow-B] R Smp D-3 D-2 D-1 Label
      % \item[SRD-narrow-C] Sample Replicate Dose-3 Dose-2 Dose-1 Label
      % \item[SRD-narrow-D] Replicate Sample Dose-3 Dose-2 Dose-1 Label

      % \item[ARDS-wide-D] Assay Replicate T:Dose-3 T:Dose-2 T:Dose-1 S:Dose-3 S:Dose-2 S:Dose-1 Label
      % \item[DRS-wide-A] D R-1:T R-2:T R-3:T R-4:T R-5:T R-6:T R-1:S R-2:S R-3:S R-4:S R-5:S R-6:S Label
      % \item[DRS-wide-B] D T:R-1 T:R-2 T:R-3 T:R-4 T:R-5 T:R-6 S:R-1 S:R-2 S:R-3 S:R-4 S:R-5 S:R-6 Label
      % \item[DRS-wide-C] Dose Replicate-1:T Replicate-2:T Replicate-3:T Replicate-4:T Replicate-5:T Replicate-6:T Replicate-1:S Replicate-2:S Replicate-3:S Replicate-4:S Replicate-5:S Replicate-6:S Label
      % \item[DRS-wide-D] Dose T:Replicate-1 T:Replicate-2 T:Replicate-3 T:Replicate-4 T:Replicate-5 T:Replicate-6 S:Replicate-1 S:Replicate-2 S:Replicate-3 S:Replicate-4 S:Replicate-5 S:Replicate-6 Label
      % \item[DSR-wide-A] D T:R-1 S:R-1 T:R-2 S:R-2 T:R-3 S:R-3 T:R-4 S:R-4 T:R-5 S:R-5 T:R-6 S:R-6 Label
      % \item[DSR-wide-B] D R-1:T R-1:S R-2:T R-2:S R-3:T R-3:S R-4:T R-4:S R-5:T R-5:S R-6:T R-6:S Label
      % \item[DSR-wide-C] Dose T:Replicate-1 S:Replicate-1 T:Replicate-2 S:Replicate-2 T:Replicate-3 S:Replicate-3 T:Replicate-4 S:Replicate-4 T:Replicate-5 S:Replicate-5 T:Replicate-6 S:Replicate-6 Label
      % \item[DSR-wide-D] Dose Replicate-1:T Replicate-1:S Replicate-2:T Replicate-2:S Replicate-3:T Replicate-3:S Replicate-4:T Replicate-4:S Replicate-5:T Replicate-5:S Replicate-6:T Replicate-6:S Label
      % \item[FARDS-wide-D] Assay Field Replicate T:Dose-3 T:Dose-2 T:Dose-1 S:Dose-3 S:Dose-2 S:Dose-1 Label
      % \item[FRDS-wide-D] Field Replicate T:Dose-3 T:Dose-2 T:Dose-1 S:Dose-3 S:Dose-2 S:Dose-1 Label
      % \item[RDS-wide-A] R D-3:T D-2:T D-1:T D-3:S D-2:S D-1:S Label
      % \item[RDS-wide-B] R T:D-3 T:D-2 T:D-1 S:D-3 S:D-2 S:D-1 Label
      % \item[RDS-wide-C] Replicate D-1.00:T D-0.10:T D-0.01:T D-1.00:S D-0.10:S D-0.01:S Label
      % \item[RDS-wide-D] Replicate T:D-0.16 T:D-0.04 T:D-0.01 S:D-0.16 S:D-0.04 S:D-0.01 Label
      % \item[RSD-wide-A] R T:D-3 S:D-3 T:D-2 S:D-2 T:D-1 S:D-1 Label
      % \item[RSD-wide-B] R D-3:T D-3:S D-2:T D-2:S D-1:T D-1:S Label
      % \item[RSD-wide-C] Replicate T:Dose-3 S:Dose-3 T:Dose-2 S:Dose-2 T:Dose-1 S:Dose-1 Label
      % \item[RSD-wide-D-EQ] Replicate Dose=3:T Dose=3:S Dose=2:T Dose=2:S Dose=1:T Dose=1:S Label
      % \item[RSD-wide-D] Replicate Dose-3:T Dose-3:S Dose-2:T Dose-2:S Dose-1:T Dose-1:S Label
      % \item[SDR-wide-A] Sample D-3:R-1 D-2:R-1 D-1:R-1 D-3:R-2 D-2:R-2 D-1:R-2 D-3:R-3 D-2:R-3 D-1:R-3 D-3:R-4 D-2:R-4 D-1:R-4 D-3:R-5 D-2:R-5 D-1:R-5 D-3:R-6 D-2:R-6 D-1:R-6 Label
      % \item[SDR-wide-B] Sample R-1:D-3 R-1:D-2 R-1:D-1 R-2:D-3 R-2:D-2 R-2:D-1 R-3:D-3 R-3:D-2 R-3:D-1 R-4:D-3 R-4:D-2 R-4:D-1 R-5:D-3 R-5:D-2 R-5:D-1 R-6:D-3 R-6:D-2 R-6:D-1 Label
      % \item[SDR-wide-C] Sample Dose-3:Replicate-1 Dose-2:Replicate-1 Dose-1:Replicate-1 Dose-3:Replicate-2 Dose-2:Replicate-2 Dose-1:Replicate-2 Dose-3:Replicate-3 Dose-2:Replicate-3 Dose-1:Replicate-3 Dose-3:Replicate-4 Dose-2:Replicate-4 Dose-1:Replicate-4 Dose-3:Replicate-5 Dose-2:Replicate-5 Dose-1:Replicate-5 Dose-3:Replicate-6 Dose-2:Replicate-6 Dose-1:Replicate-6 Label
      % \item[SDR-wide-D] Sample Replicate-1:Dose-3 Replicate-1:Dose-2 Replicate-1:Dose-1 Replicate-2:Dose-3 Replicate-2:Dose-2 Replicate-2:Dose-1 Replicate-3:Dose-3 Replicate-3:Dose-2 Replicate-3:Dose-1 Replicate-4:Dose-3 Replicate-4:Dose-2 Replicate-4:Dose-1 Replicate-5:Dose-3 Replicate-5:Dose-2 Replicate-5:Dose-1 Replicate-6:Dose-3 Replicate-6:Dose-2 Replicate-6:Dose-1 Label
      % \item[SRD-wide-A] Sample R-1:D-3 R-2:D-3 R-3:D-3 R-4:D-3 R-5:D-3 R-6:D-3 R-1:D-2 R-2:D-2 R-3:D-2 R-4:D-2 R-5:D-2 R-6:D-2 R-1:D-1 R-2:D-1 R-3:D-1 R-4:D-1 R-5:D-1 R-6:D-1 Label
      % \item[SRD-wide-B] Sample D-3:R-1 D-3:R-2 D-3:R-3 D-3:R-4 D-3:R-5 D-3:R-6 D-2:R-1 D-2:R-2 D-2:R-3 D-2:R-4 D-2:R-5 D-2:R-6 D-1:R-1 D-1:R-2 D-1:R-3 D-1:R-4 D-1:R-5 D-1:R-6 Label
      % \item[SRD-wide-C] Sample Replicate-1:Dose-3 Replicate-2:Dose-3 Replicate-3:Dose-3 Replicate-4:Dose-3 Replicate-5:Dose-3 Replicate-6:Dose-3 Replicate-1:Dose-2 Replicate-2:Dose-2 Replicate-3:Dose-2 Replicate-4:Dose-2 Replicate-5:Dose-2 Replicate-6:Dose-2 Replicate-1:Dose-1 Replicate-2:Dose-1 Replicate-3:Dose-1 Replicate-4:Dose-1 Replicate-5:Dose-1 Replicate-6:Dose-1 Label
      % \item[SRD-wide-D] Sample Dose-3:Replicate-1 Dose-3:Replicate-2 Dose-3:Replicate-3 Dose-3:Replicate-4 Dose-3:Replicate-5 Dose-3:Replicate-6 Dose-2:Replicate-1 Dose-2:Replicate-2 Dose-2:Replicate-3 Dose-2:Replicate-4 Dose-2:Replicate-5 Dose-2:Replicate-6 Dose-1:Replicate-1 Dose-1:Replicate-2 Dose-1:Replicate-3 Dose-1:Replicate-4 Dose-1:Replicate-5 Dose-1:Replicate-6 Label
    }
  The pattern of special characters in the column names of columns with
  responses should be identical.
  
  2. form: Matrix of measurement by variable:
  
  If the header of the file contains the text-string
  "Response", then a "data.frame" with rows of measurements
  and columns of variables and factors is expected.
  This is used for latin square designs.

  Labels (text-lines for the "report"):
  
  Labels as e.g. \code{design}, \code{dilutionRatio}, \code{model},
  \code{Assay} and \code{Project}, etc. are extracted from the
  label-field in lines after the response values.
  
  The first character in these lines has to be "#" when a "matrix"
  of measurements by variables is entered. It is also suggested to start
  the lines by "#", when a table of responses is entered.
  
}
\value{
  An object of class \link{assayTable-class} or \link{assayFrame-class}
  with many more slots than the following, but these are the most
  important for the functions of this package:
  \item{tableRaw}{ The untransformed table read into a \link{data.frame}. }
  \item{design}{ A character string. }
  \item{factor}{ A numeric vector. }
  \item{dilutionRatio}{ A numeric. }
  \item{dfAdjustment}{ A numeric. }
  \item{projectTitle}{ Title of assay. }
  \item{assayTitle}{ Tag for names of e.g. plots. }

  The returned objects have the methods
  \link{print},
  \link{show},
  \link{as.data.frame},
  \link{as.array}, and
  \link{as.table}.
  \link{as.array} and \link{as.table} has the arguments
  \code{reduced} and \code{selectFun}.
  With the boolean argument \code{reduced} the factor of \code{sample}
  and factor of \code{dilution} are combined, with output similar to
  using \code{row.vars} for \link{ftable}, but labels of \code{dose}
  can then be different across \code{samples}.
  The function \code{selectFun} should work on the array of all the read
  factors. 
  For objects of class \link{assayFrame-class} also the arguments
  \code{which}, \code{FUN} and \code{responseName} are available.
  \code{which} gives the factors to determined the array, either by
  indices, or names by text strings. The function is by default
  \link{mean}, and is used to calculate the value of the cell in the
  array from the available responses in the cell.

}
\references{
  http://en.wikipedia.org/wiki/Dilution_assay
  }
\author{Jens Henrik Badsberg}
\seealso{\link{pla}}
\examples{
\dontrun{
library (lattice)
as.array(barley, 1:3, type = "counts", reduced = TRUE)
as.array(barley, 1:3, reduced = TRUE)
}
as.array(data.frame(Titanic), 1:4)
as.array(data.frame(CO2), response = "conc",
         factorNames = c("Plant", "Type", "Treatment"))
as.array(data.frame(CO2), response = "uptake",
         factorNames = c("Plant", "Type", "Treatment"))
as.array(data.frame(ChickWeight), response = "weight",
         factorNames = c("Time", "Chick", "Diet"))
as.array(npk)
}
\keyword{ mich }
