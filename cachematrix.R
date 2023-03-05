## A combination of 2 functions: makeCacheMatrix, cacheSolve used to calculate and cache the inverse of a matrix

## STEP 1 create a special 'matrix' that stores a matrix x and cache its inverse (supposing that x is inversible)

makeCacheMatrix <- function(x = matrix()) {
    s<-NULL
    set<-function(y){
        x<<-y
        s<<-NULL
    }
    get<-function()x 
    setinverse<-function(solve) s<<-solve
    getinverse<-function()s 
    list(set=set,get=get,
         setinverse=setinverse,
         getinverse=getinverse)
}

## STEP 2 calculate the inverse of x or retrieve the inverse of x from cache

cacheSolve <- function(x, ...) {
    s<-x$getinverse()
    if(!is.null(s)){
        message("getting cached data")
        return(s)
    }
    data<-x$get()
    s<-solve(data,...)
    x$setinverse(s)
    s
    ## Return a matrix that is the inverse of 'x'

    }

