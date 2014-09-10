\name{snvToPepFasta}
\alias{snvToPepFasta}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Single nucleotide variant (SNV) to peptide workflow 
%%  ~~function to do ... ~~
}
\description{
This is a wrapper for the whole computing of SNV mutations into transcripts, digest these transcripts into
small peptides and write the result into a FASTA file, that can be used for further analysis 
(e.g. compare to mass spectrometry results).

%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
snvToPepFasta(tbl, glst, mymart, myarchive, spath, tpath, width = 60,
intermediate = FALSE, target = "K|R", exception = "P")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tbl}{Data.frame of ANNOVAR annotated SNVs. 
%%     ~~Describe \code{tbl} here~~
}
  \item{glst}{Data.frame of gennames, column Genes.
%%     ~~Describe \code{glst} here~~
}
  \item{mymart}{Mart to retrieve the ENST from via biomaRt. 
%%     ~~Describe \code{mymart} here~~
}
  \item{myarchive}{Logical that indicates if a archive mart is given, (default FALSE).
%%     ~~Describe \code{myarchive} here~~
}
  \item{spath}{Character string giving the path to HUMAN Ensemble peptide database in FASTA.
%%     ~~Describe \code{spath} here~~
}
  \item{tpath}{Character string giving the path where to write the mutated and digested sequences in FASTA format.
%%     ~~Describe \code{tpath} here~~
}
  \item{width}{Width of the sequence in the result (default 60).
%%     ~~Describe \code{width} here~~
}
  \item{intermediate}{Logical, TRUE if you would like to have intermediate output, FALSE if not (default). 
%%     ~~Describe \code{width} here~~

}
  \item{target}{Character string, pattern to be matched before the cleavage site (default "K|R"). 
%%     ~~Describe \code{width} here~~
}
  \item{exception}{Character string, pattern that avoids a cleavage when it can be found behind it. (default"P"). 
%%     ~~Describe \code{width} here~~
}
}

\details{


The Refseq mRNA ID NM_ID will be used by biomaRt to querry the Ensemble transcript ID (ENST).\cr
\url{http://www.ncbi.nlm.nih.gov/refseq/} \cr\cr

The \bold{header} of the FASTA file will look like this:\cr
>ENST|description| originalAminoacid->mutatedAminoacid_positionAminoacid ... \cr\cr
If the \bold{annotated change does not fit} to the ENST it will look like:\cr
wrong: originalAminoacid->mutatedAminoacid_positionAminoacid \cr\cr
If the ENST matches \bold{two or more NM_IDs}, there will be a counter in the header:\cr
>ENSTxcounter|... \cr\cr
\bold{Trypsination rule}: cut after K and R except when followed by P\cr\cr

You can use target and exception to set other rules for digestion.\cr
The patterns for target and exception are restricted to one aminoacid.\cr
Aminoacids: ARNDCQEGHILKMFPSTWYV\cr
valid patterns: A|R|W|H, P|S\cr
invalid patterns: Z|F|A|D, AR|NDC|STW\cr

The analysis is based on Ensembl proteindata: \cr
\url{http://www.ensembl.org/index.html} \cr
The SNVs annotation has to look like ANNOVAR: \cr
\url{http://www.openbioinformatics.org/annovar/} \cr


%%  ~~ If necessary, more details than the description above ~~
}

\value{
If you set intermediate to TRUE you will get the following output:\cr
\item{aachanges }{A data.frame like tbl, with new columns that describe the aminoacid changes. }
\item{transcripts }{Data.frame, containing: ensemble_transcript_id, nmid and pname.}
\item{mutfasta }{Character vector that contains FASTA headers and peptide sequences.}
\item{mutlog}{Character vector contains log entries of errors reported during mutation (mutateProtToPep()). }
Otherwise just a character vector where to find the FASTA file or
an error message.
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}

\author{
%%  ~~who you are~~
Rafael Dellen \cr
\email{Rafael.Dellen@uni-duesseldorf.de} \cr
}
\note{
The intermediate output will be big (in most cases), use a variable to save the result.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~


\examples{
#load data and set arguments

#data.frame with SNVs
tbl <- system.file("extdata", "ExampleData.RData", package="PepPrep")
load(tbl)

glst <- data.frame(Genes="CAP1", stringsAsFactors=FALSE)

#peptide sequence
spath <- system.file("extdata", "ExampleHomo_sapiens.GRCh37.70.pep.all.fa", package="PepPrep")

#where to write the result and how to write
tpath <- paste0(getwd(), "/myTest_snvToPep.fasta")
width <- 60

#biomaRt settings
mymart <- "ensembl"
myarchive <- FALSE

#call workflow
\dontrun{
test <- snvToPepFasta(testtbl, glst, mymart, myarchive, spath, tpath,width)
test2 <- snvToPepFasta(testtbl, glst, mymart, myarchive, spath, tpath, width, intermediat= TRUE)}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.

