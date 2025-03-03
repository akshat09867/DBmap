library(testthat)
library(DBmaps)
library(data.table)

test_that("map.DB.pairs returns a data.table with correct columns", {
  tables <- list(table1 = data.table(id = 1:3), table2 = data.table(id = 1:3))
  result <- map.DB.pairs(tables)
  expect_s3_class(result, "data.table")
  expect_equal(names(result), c("table_x", "table_y", "can_join", "by_x", "by_y"))
})

test_that("map.DB.pairs handles tables with no common keys", {
  tables <- list(table1 = data.table(id = 1:3), table2 = data.table(x = 4:6))
  result <- map.DB.pairs(tables)
  expect_s3_class(result, "data.table")
  expect_false(result$can_join[1])  # Now correctly FALSE
})
