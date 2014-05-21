##
## Made by Fredrik Emilsson
##
## These two functions make it possible to cache the invers of an NxN matrix.
## Here is an example:
## B = matrix(c(2, 4, 3, 1),nrow=2,ncol=2)
## test <- makeCacheMatrix(B)
## cacheSolve(test)
##
## If you runs cacheSolve(test) again you will see that the data is cached.

## This function handles an NxN matrix and the value of its invers. 
## In parameter is a normal NxN matrix.
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(solve) inv <<- solve
  getinv <- function() inv
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## This function is used to get the invers of an NxN matrix. When re-running 
## the function again the cached data is used.
## In parameter is the result of the makeCacheMatrix function.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getinv()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinv(inv)
  inv
}
