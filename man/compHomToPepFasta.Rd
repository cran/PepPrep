\name{compHomToPepFasta}
\alias{compHomToPepFasta}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Comparison of proteins and creating homologous peptides workflow
%%  ~~function to do ... ~~
}
\description{
This is a wrapper for searching pairs of protein sequences by UniProt EntryName, digesting both sequences with trypsin, find homologous parts, remove duplicates, build a new sequence out of them and write the result into a FASTA file, that can be used for further analysis (e.g. compare to mass spectrometry results).
}
\usage{
compHomToPepFasta(path_o1,path_o2,path,width,intermediate = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{path_o1}{Character string indicating the path to a uniprot proteom FASTA database, for the first organism.
%%     ~~Describe \code{x} here~~
}
 \item{path_o2}{Character string indicating the path to a uniprot proteom FASTA database, for the second organism.
%%     ~~Describe \code{x} here~~
}
 \item{path}{Character string indicating the path where to write the resulting FASTA file.
%%     ~~Describe \code{x} here~~
}
  \item{width}{Width of the sequence in the result (default 60).
%%     ~~Describe \code{width} here~~
}
  \item{intermediate}{Logical, TRUE if you would like to have intermediate output, FALSE if not (default). 
%%     ~~Describe \code{width} here~~
}
}
\details{
Searching pairs of protein sequences by UniProt EntryName in both organisms:\cr
\bold{Org1:} Human\cr
>sp|P31946|\bold{1433B_HUMAN} 14-3-3 protein beta/alpha OS=Homo sapiens GN=YWHAB PE=1 SV=3\cr
\bold{Org2:} Mouse\cr
>sp|Q9CQV8-2|\bold{1433B_MOUSE} Isoform Short of 14-3-3 protein beta/alpha OS=Mus musculus GN=Ywhab\cr
>sp|Q9CQV8|\bold{1433B_MOUSE} 14-3-3 protein beta/alpha OS=Mus musculus GN=Ywhab PE=1 SV=3\cr
\bold{Pairs:}\cr
P31946|1433B_HUMAN  Q9CQV8-2|1433B_MOUSE\cr
P31946|1433B_HUMAN	Q9CQV8|1433B_MOUSE\cr

Digesting both sequences with trypsin:\cr
\bold{Org1:} >sp|P31946|1433B_HUMAN ...\cr
MTMD\bold{K}SELVQ\bold{K}A\bold{K}LAEQAE\bold{R}YDDMAAAM\bold{K}...\cr
\bold{Org2:} >sp|Q9CQV8-2|1433B_MOUSE ...\cr 
MD\bold{K}SELVQ\bold{K}A\bold{K}LAEQAE\bold{R}YDDMAAAM\bold{K}...\cr

Find homologous parts, remove duplicates, build a new sequence out of them:\cr
\bold{Homolog Org1Org2:} >sp|P31946|1433B_HUMAN ... org2:sp|Q9CQV8-2|1433B_MOUSE ...\cr
SELVQ\bold{K}A\bold{K}LAEQAE\bold{R}YDDMAAAM\bold{K}...\cr

Write the result into a FASTA file, that can be used for further analysis (e.g. compare to mass spectrometry results).

UniProt, the source of the proteoms: \cr
\url{http://www.uniprot.org/} \cr
%%  ~~ If necessary, more details than the description above ~~
}

\value{
If you set intermediate to TRUE you will get the following output:\cr
\item{tbl }{A data.frame that contains the proteinpairs, the header and the homologous sequence.}
\item{fasta }{Character vector of the resulting FASTA file.}
Otherwise just a character vector where to find the FASTA file.
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}


\author{
Rafael Dellen \cr
\email{Rafael.Dellen@uni-duesseldorf.de} 

%%  ~~who you are~~
}
\note{
The intermediate output will be big (in most cases), use a variable to save the result.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~


\examples{
#load data and set arguments

#Uniprot proteom FASTA databases 
#(just a small example with two proteins each)
path_o1 <- system.file("extdata", "ExampleHumanProt.fasta", package="PepPrep")
path_o2 <- system.file("extdata", "ExampleMouseProt.fasta", package="PepPrep")

#where to write the result and how to formate
path <- paste0(getwd(), "/myTest_compHomToPep.fasta")
width <- 60

#call workflow
test <- compHomToPepFasta(path_o1, path_o2, path, width)
test <- compHomToPepFasta(path_o1, path_o2, path, width, intermediate=TRUE)
}

