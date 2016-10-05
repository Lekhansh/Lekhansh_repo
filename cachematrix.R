## Aim is to write a function that can be used to cache the inverse of matrix and return the output if the matrix has not changed.

## Writing a function to create a special matrix object that can catch its inverse and store it.

makeCacheMatrix <- function(x = matrix()) {
  # x has to be a square invertible matrix, x has been initialised as an argument to the CacheMatrix function.
inve <- NULL # initialising inve variable and setting the value to NULL.
  set <- function(y){ # defining a function set in the environment of makeCacheMatrix function.
  x <<- y # assigning the value of x to y in this environment.
  inve = NULL
  }
  get <- function() x 
  setinverse <- function(inverse) inve <<- inverse
  getinverse <- function() inve
  list(set = set,get = get, setinverse = setinverse, getinverse = getinverse)
}


## This will take the list returned by the above function as an input. It will return the cached value if the matrix is not changed or will calculate the inverse and return it.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
inve <- x$getinverse()
if (!is.null(inve)){ # checking if inverse has already been calculated
  message("getting chached data") # if yes return the value from cache
  return(inve)
}
 my_matrix <- x$get() # if not then calculate the inverse and return
 inve <- solve(my_matrix)
 x$setinverse(inve)
 return(inve)
}

