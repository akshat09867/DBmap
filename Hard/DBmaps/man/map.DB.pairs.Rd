
\name{map.DB.pairs}
\alias{map.DB.pairs}
\title{Map Database Pairs}
\usage{
map.DB.pairs(tables)
}
\arguments{
\item{tables}{A list of tables in the database.}
}
\value{
A data.table with columns: table_x, table_y, can_join, by_x, by_y.
}
\description{
Searches pairs of tables to determine if they can be joined and identifies linking variables.
}
