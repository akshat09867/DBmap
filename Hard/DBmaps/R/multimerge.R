#' Multi-Merge Tables
#'
#' Sequentially merges multiple tables based on linking variables and join types.
#'
#' @param tables A list of data.tables to merge.
#' @param by A list of vectors specifying the linking variables for each merge step.
#' @param join_types A vector of join types (e.g., "left", "right", "inner", "outer").
#' @return A single merged data.table.
#' @export
multi.merge <- function(tables, by, join_types) {
  if (length(tables) < 2) {
    stop("At least two tables are required for merging.")
  }
  if (length(by) != length(tables) - 1) {
    stop("The length of 'by' must be one less than the number of tables.")
  }
  if (length(join_types) != length(tables) - 1) {
    stop("The length of 'join_types' must be one less than the number of tables.")
  }

  # Initialize with the first table
  result <- tables[[1]]

  for (i in seq_along(by)) {
    result <- merge(result, tables[[i + 1]], by = by[[i]], all.x = join_types[[i]] == "left",
                    all.y = join_types[[i]] == "right", all = join_types[[i]] == "outer")
  }

  return(result)
}