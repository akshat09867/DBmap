library(testthat)
library(DBmaps)
library(data.table)

test_that("multi.merge works correctly", {
  # Create sample tables
  table1 <- data.table(id = c(1, 2, 3), name = c("Alice", "Bob", "Charlie"))
  table2 <- data.table(id = c(1, 2, 4), score = c(90, 85, 88))
  table3 <- data.table(id = c(1, 3, 4), age = c(20, 22, 21))


  by <- list(c("id"), c("id"))
  join_types <- c("left", "inner")


  result <- multi.merge(tables = list(table1, table2, table3), by = by, join_types = join_types)


  expect_s3_class(result, "data.table")
  expect_equal(nrow(result), 2) # Only rows with id 1 and 2 should remain after inner join
  expect_equal(names(result), c("id", "name", "score", "age"))
})