# Data Table Merging in R

## Easy: Basic Merge Operations

The easy section demonstrates fundamental merging techniques using the `merge()` function in R's data.table library.

### Merge Variations

1. **Simple Merge (Default)**
   - Returns only rows with matching IDs in both tables
   - Equivalent to an inner join
   - Result includes only students B and C

2. **Left Join (`all.x = TRUE`)**
   - Keeps all rows from the left table (students)
   - Missing values are filled with NA
   - Result includes all students A, B, C, D

3. **Right Join (`all.y = TRUE`)**
   - Keeps all rows from the right table (scores)
   - Missing values are filled with NA
   - Result includes students B, C, and E

4. **Full Outer Join (`all = TRUE`)**
   - Keeps all rows from both tables
   - Missing values are filled with NA
   - Result includes students A, B, C, D, and E

## Medium: Flexible Merge Function

The medium section introduces a more advanced `merges()` function that provides flexible merging capabilities.

### Key Features of `merges()` Function
- Automatically detects common columns for merging
- Allows manual specification of merge columns
- Supports merging three tables in a single operation
- Includes robust error handling for various merge scenarios

### Merge Strategies Demonstrated
1. Auto-detect common columns
2. Specify specific columns for merging
3. Handle different column names between tables
4. Merge multiple tables with various joining strategies

## Hard:DBmaps

The `DBmaps` package provides tools for exploring, mapping, and merging tables in relational databases. It simplifies the process of understanding database structures, identifying relationships between tables, and automating the merging of data from multiple tables.
