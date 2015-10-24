##This R script takes a matrix and calculate its inverse
##If the inverse is already calculated in the first
##function, the second function will grab it from cache 

## This function creates four other function: set the
## matrix, get the matrix, set the inverse and get the
## inverse. It stores the inverse in cache.

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y) {
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setinv <- function(inverse) m <<- inverse
	getinv <- function() m
	list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## This function first try to find the inverse of matrix x
## from cache. If it finds the inverse, it prints it out and
## breaks out from the if statment. If it cannot find it in
## cache, it will calcuate the inverse using solve().

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	m <- x$getinv()
	if(!is.null(m)) {
		message("getting cached data")
		return(m)
	}
	data <- x$get()
	m <- solve(data, ...)
	x$setinv(m)
	m
}
