
\name{create.DB.map}
\alias{create.DB.map}
\title{Create a Database Map}
\usage{
create.DB.map(tables)
}
\arguments{
\item{tables}{A list of tables in the database.}
}
\value{
A data.table with columns: table_x, table_y, can_join, by_x, by_y, join_type, aggregations.
}
\description{
Constructs a data.frame or data.table object that maps relationships between tables in a database.
}
