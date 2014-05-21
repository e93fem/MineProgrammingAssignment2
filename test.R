setwd("C:\\Users\\Fredrik\\Documents\\R Programming\\Assignments\\Assignment 2\\MineProgrammingAssignment2")
source("cachematrix.R")

B = matrix(c(2, 4, 3, 1),nrow=2,ncol=2)
test <- makeCacheMatrix(B)
test$getinv()
cacheSolve(test)