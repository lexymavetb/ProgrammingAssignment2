## Introduction
# Matrix inversion is usually a costly computation and there may 
# be some benefit to caching the inverse of a matrix rather than 
# computing it repeatedly. The pair of function that cache the 
# inverse of a matrix are:
# 1. makeCacheMatrix     
# 2. cacheSolve

## makeCacheMatrix Function
# The first function, makeCacheMatrix creates a special "matrix" 
# which is really a list containing a function to:

# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the inverse of the matrix
# 4. get the inverse of the matrix


makeCacheMatrix <- function(x = numeric()) {
  m <- NULL
  set <- function(y) 
  {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## cacheSolve Function
# The second function, cacheSolve calculates the inverse of the 
# special "matrix" returned by makeCacheMatrix above. If the 
# inverse has already been calculated (and the matrix remains the 
# same), then cacheSolve should retrieve the inverse from the 
# cache. Otherwise, it calculates the inverse of the data and sets the
# inverse matrix in the cache via the setinverse function.


cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    if(!is.null(m)) {
      message("getting cached data")
      return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
  }


## Sample test-run:
## > x = rbind(c(4, -1/5), c(-1/5, 4))
## > m = makeCacheMatrix(x)
## > m$get()

## Initial Output:
## [,1] [,2]
## [1,]  4.0 -0.2
## [2,] -0.2  4.0

## First run without cache:
## > cacheSolve(m)
##  [,1]       [,2]
## [1,] 0.25062657 0.01253133
## [2,] 0.01253133 0.25062657

## Cache retrieval at second run:
## > cacheSolve(m)
## getting cached data
## [,1]       [,2]
## [1,] 0.25062657 0.01253133
## [2,] 0.01253133 0.25062657
## > 
  
