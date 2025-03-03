library(data.table)

merges <- function(t1, t2, t3, by1_2 = NULL, by2_3 = NULL) {
  setDT(t1)
  setDT(t2)
  setDT(t3)
  
  if (is.null(by1_2)) {
    common_cols_1_2 <- intersect(names(t1), names(t2))
    if (length(common_cols_1_2) == 0) {
      stop("No common columns between t1 and t2. Please specify 'by1_2'.")
    }
    
    merged_1_2 <- merge(t1, t2, by = common_cols_1_2)
  } else if (is.character(by1_2) && length(by1_2) == 1) {
    if (!(by1_2 %in% names(t1) && by1_2 %in% names(t2))) {
      stop(paste("Column", by1_2, "not found in both t1 and t2."))
    }
    merged_1_2 <- merge(t1, t2, by = by1_2)
  } else if (is.list(by1_2) && length(by1_2) == 2) {
    by_x <- by1_2[[1]]
    by_y <- by1_2[[2]]
    
    if (!(by_x %in% names(t1))) {
      stop(paste("Column", by_x, "not found in t1."))
    }
    if (!(by_y %in% names(t2))) {
      stop(paste("Column", by_y, "not found in t2."))
    }
    
    merged_1_2 <- merge(t1, t2, by.x = by_x, by.y = by_y)
  } else {
    stop("'by1_2' must be NULL, a single column name, or a list of two column names.")
  }
  
  if (is.null(by2_3)) {
    common_cols_2_3 <- intersect(names(merged_1_2), names(t3))
    if (length(common_cols_2_3) == 0) {
      stop("No common columns between merged result and t3. Please specify 'by2_3'.")
    }
    final_result <- merge(merged_1_2, t3, by = common_cols_2_3)
  } else if (is.character(by2_3) && length(by2_3) == 1) {

    if (!(by2_3 %in% names(merged_1_2) && by2_3 %in% names(t3))) {
      stop(paste("Column", by2_3, "not found in both merged result and t3."))
    }
    final_result <- merge(merged_1_2, t3, by = by2_3)
  } else if (is.list(by2_3) && length(by2_3) == 2) {
    by_x <- by2_3[[1]]
    by_y <- by2_3[[2]]
    
    if (!(by_x %in% names(merged_1_2))) {
      stop(paste("Column", by_x, "not found in merged result."))
    }
    if (!(by_y %in% names(t3))) {
      stop(paste("Column", by_y, "not found in t3."))
    }
    
    final_result <- merge(merged_1_2, t3, by.x = by_x, by.y = by_y)
  } else {
    stop("'by2_3' must be NULL, a single column name, or a list of two column names.")
  }
  
  final_result
}

# Example data 
table1 <- data.table( Training = c("Strength", "Stamina", "Other"), Pulse = c(100, 150, 120), Duration = c(60, 30, 45) )
table2 <- data.table( Training = c("Stamina", "Other"), Calories = c(300, 400) )
table3 <- data.table( Training = c("Strength", "Stamina", "Other"), Steps = c(3000, 6000, 2000) )

# Auto-detect common columns for both merges
result1 <- merges(table1, table2, table3)
result1
# Specify column for first merge, auto-detect for second merge
result2 <- merges(table1, table2, table3, by1_2 = "Training")
result2
# Specify different columns for first merge
result3 <- merges(table1, table2, table3, by1_2 = list("Training", "Training"))
result3
# Specify columns for both merges
result4 <- merges(table1, table2, table3, by1_2 = "Training", by2_3 = "Training")
result4
# Specify different columns for second merge
result5 <- merges(table1, table2, table3, by1_2 = "Training", by2_3 = list("Training", "Training"))
result5