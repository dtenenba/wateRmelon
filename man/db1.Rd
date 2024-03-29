\name{db1}
\alias{db1}
\alias{dfs2}
\alias{dfsfit}
\title{
Internal wateRmelon functions for calculating betas 
}
\description{
db1 is used for quantile normalizing methylated together with unmethylated (dye bias methods nanet, nanes, danes and danet.  dfs* functions are used for smoothing the background equalization in methods whose names start with d (daten etc).
}
\usage{
db1(mn, un)
dfsfit(mn, onetwo, roco=unlist(data.frame(strsplit(colnames(mn), "_"),
                 stringsAsFactors = FALSE)[2, ]) )

dfs2(x, onetwo)

}
%- maybe also 'usage' for other objects documented here.
\arguments{

  \item{mn, x}{
matrix of methylated signal intensities, each column representing a sample 
(default method), or an object for which a method is available. For dfsfit 
and dfs2 this can also be a matrix of unmethylated intensities.
   }

  \item{un}{
matrix of unmethylated signal intensities, each column representing a sample
(default method) or NULL when mn is an object containing methylated and 
unmethylated values.
  }
  

  \item{onetwo}{
character vector or factor of length nrow(mn) indicating assay type 'I'
or 'II' 
}

   \item{roco}{ roco for dfsfit giving Sentrix rows and columns. 
This allows a background gradient model to be fit.  This is split from 
data column names by default.  roco=NULL disables model fitting
(and speeds up processing), otherwise roco can be supplied as a 
character vector of strings like 'R01C01' (3rd and 6th characters used).
   }
}
\details{
db1    - quantile normalizes methylated against unmethylated (basic function for
dyebuy* dye bias methods).
dfsfit - corrects the difference in backgrounds between type I and type II assays and fits a linear model to Sentrix rows and columns if these are available to improve precision where there is a background gradient.
dfs2   - finds the difference between type I and type II assay backgrounds for one or more samples.
%%  ~~ If necessary, more details than the description above ~~
}
\value{
db1    - a list of 2 matrices of intensities, methylated and unmethylated
dfsfit - a matrix of adjusted intensities
dfs2   - a background offset value

%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
Pidsley R, Wong CCY, Volta M, Lunnon K, Mill J, Schalkwyk LC: 
A data-driven approach to preprocessing Illumina 450K methylation 
array data (submitted)
}
\author{
Leonard.Schalkwyk@kcl.ac.uk
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%%\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
%}
