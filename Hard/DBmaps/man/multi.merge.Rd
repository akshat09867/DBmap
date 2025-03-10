
\name{multi.merge}
\alias{multi.merge}
\title{Multi-Merge Tables}
\usage{
multi.merge(tables, by, join_types)
}
\arguments{
\item{tables}{A list of data.tables to merge.}

\item{by}{A list of vectors specifying the linking variables for each merge step.}

\item{join_types}{A vector of join types (e.g., "left", "right", "inner", "outer").}
}
\value{
A single merged data.table.
}
\description{
Sequentially merges multiple tables based on linking variables and join types.
}
