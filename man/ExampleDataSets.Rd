\name{ExampleDataSets}
\alias{ExampleDataSets}
\docType{data}
\title{
Summary of example data sets.
}
\description{
Explaining example data of PepPrep package.
}

\details{
\file{ExampleData.RData} contains a data.frame called \code{testtbl} (annotated single nucleotide variant (SNV)).\cr
Columns in \code{testtbl}:\cr
Chr: Chromosom number\cr
Start: Startposition \cr
End: Endposition \cr
Ref: Nucleotide in referencegenome \cr
Obs: Observed Nucleotide \cr
AAChange: Information from ANNOVAR it should look like NM_ID:c.Ref_Pos_Obs:p.RefAminoacid_Pos_MutAminoacid \cr
Gene: Gene name\cr\cr

\file{ExampleHomo_sapiens.GRCh37.70.pep.all.fa}\cr
Contains the Ensembl protein ENSP00000361883 in FASTA format\cr\cr

\file{ExampleHumanProt.fasta}\cr
Two human protein sequneces from UniProt.\cr\cr
\file{ExampleMouseProt.fasta}\cr
Two mouse protein sequences from UniProt.\cr\cr

}


\examples{
testtbl <- system.file("extdata", "ExampleData.RData", package="PepPrep")
load(testtbl)
testtbl
attributes(testtbl)
lapply(testtbl,class)

}
\keyword{datasets}
