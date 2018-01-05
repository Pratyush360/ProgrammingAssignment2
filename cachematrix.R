## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##makeCacheMatrix function is used to store x and i in the enclosing environment of set,get,setinverse,getinverse
##that is the environment in which they were defined

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
  set <- function(y) {
          x <<- y
          i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## Write a short comment describing this function
##this function search for the inverse of given matrix if itis not previously calculated then
##get matrix from above function,calculate its inverse and set the value in above function using setinverse
cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if (!is.null(i)) {
          message("getting cached data")
          return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}
