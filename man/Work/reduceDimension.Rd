\name{reduceDimension}
\alias{reduceDimension}
\title{Reduce the number of dimensions by one
}
\description{Combines the last two dimensions to one dimension. }
\usage{
reduceDimension(Array, namesPermuted = dimnames(Array),
                selectFun = function (array) NULL)
}
\arguments{
  \item{Array}{ An \link{array}. }
  \item{namesPermuted}{ A list of character vectors, \code{dimnames},
  where the last two vectors are used for the names of the combined
  dimension. }
  \item{selectFun}{ A \link{function}. }
}
\author{Jens Henrik Badsberg}
\keyword{ mich }
