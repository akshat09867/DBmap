library(data.table)


students <- data.table(id = c("A", "B", "C", "D"), Birthdate = c("2001-08-04", "2002-04-28", "2002-06-13", "2002-02-09"))


scores <- data.table(id = c("B", "C", "E"), homework = c(87,94,92), quiz = c(91, 90, 87))


merge(students,scores)
merge(students,scores,all.x=TRUE)
merge(students,scores,all.y=TRUE)
merge(students, scores, all=TRUE)


