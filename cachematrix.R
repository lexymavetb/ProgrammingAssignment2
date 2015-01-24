## Introduction
# Matrix inversion is usually a costly computation and there may 
# be some benefit to caching the inverse of a matrix rather than 
# computing it repeatedly. The pair of function that cache the 
# inverse of a matrix are:
# 1. makeCacheMatrix     
# 2. cacheSolve

## makeCacheMatrix Function
# The first function, makeCacheMatrix creates a special "matrix" 
# object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {

}


## cacheSolve Function
# The second function, cacheSolve computes the inverse of the 
# special "matrix" returned by makeCacheMatrix above. If the 
# inverse has already been calculated (and the matrix has not 
# changed), then cacheSolve should retrieve the inverse from the 
# cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
