#' Map Database Pairs
#'
#' Searches pairs of tables to determine if they can be joined and identifies linking variables.
#'
#' @param tables A list of tables in the database.
#' @return A data.table with columns: table_x, table_y, can_join, by_x, by_y.
#' @export
map.DB.pairs <- function(tables) {
  library(data.table)
  
  table_names <- names(tables)
 
  result <- data.table(table_x = character(), 
                       table_y = character(), 
                       can_join = logical(), 
                       by_x = list(), 
                       by_y = list())


  for (i in seq_along(table_names)) {
    for (j in seq_along(table_names)) {
      if (i >= j) next  
      
      table_x <- tables[[i]]
      table_y <- tables[[j]]
      
      # Find common column names
      common_keys <- intersect(names(table_x), names(table_y))
      
      # Determine if the tables can be joined
      can_join <- ifelse(length(common_keys) > 0, TRUE, FALSE)
      
      # Append result
      result <- rbind(result, data.table(
        table_x = table_names[i],
        table_y = table_names[j],
        can_join = can_join,
        by_x = list(common_keys),
        by_y = list(common_keys)
      ))
    }
  }
  
  return(result)
}
