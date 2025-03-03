library(testthat)
library(DBmaps)
library(data.table)

test_that("create.DB.map returns a data.table with correct columns", {
  tables <- list(table1 = data.table(id = 1:3), table2 = data.table(id = 1:3))
  result <- create.DB.map(tables)
  expect_s3_class(result, "data.table")
  expect_equal(names(result), c("table_x", "table_y", "can_join", "by_x", "by_y", "join_type", "aggregations"))
})

test_that("create.DB.map handles empty tables", {
  tables <- list(table1 = data.table(), table2 = data.table())
  result <- create.DB.map(tables)
  expect_s3_class(result, "data.table")
  expect_equal(nrow(result), 0)
})