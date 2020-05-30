## Put comments here that give an overall description of what your
## functions do

## Creates a matrix object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
	i <- NULL
	set <- function(y){
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setinverse <- function(solve) i <<- solve
	getinverse <- function() i
	list(set = set, get = get,
		setinverse = setinverse,
		getinverse = getinverse)
}


## Computes inverse of cache matrix
cacheSolve <- function(x, ...) {
	i <- x$getinverse()
	if(!is.null(i)){
		message("getting cached data")
		return(i)
	}
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
    i
    ## Return a matrix that is the inverse of 'x'
}
