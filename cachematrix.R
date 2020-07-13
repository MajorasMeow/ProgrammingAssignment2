## These functions are part of the coursera programming assignment 2
## In summary, they calculate an inverse matrix of an input matrix and store it into cache for later use

## This is the first function which creates variables and organizing them
makeCacheMatrix<-function(x=matrix()){ ## makes the function with x is a matrix as default
        i<-NULL ## creates i and sets it NULL for later use
        set<-function(y){ ##creates the set() function with y as an argument
                x<<-y ## says that it assignes y to x from the environment above
                i<<-NULL ##...and at the same time sets i to NUll in case there is already something in the cache
        }
        get<-function()x## we define the get function which just gives us x
        setinv<-function(inv)i <<- inv ## we define setinv function which takes inv and assigns it to i from environment above
        getinv<-function()i ## defines getinv which just gives us the i
        list(set = set,
             get = get,
             setinv = setinv,
             getinv = getinv) ## creating a list with names for the functions for later, to subset in the next function via $operator
}



## This is the second funcion, which calculates the inverse matrix and uses lexical scoping of the first function
## to store it into cache

cacheSolve<-function(x,...){ ## create cachesolve function with x as an argument
        i<-x$getinv() ## assigns the makecachmatrix inv to i via $ operator
        if(!is.null(i)){ ## if i is not null (means inv frome makecachematrix is not null...so there is sth in the cache set)...
                message("Cached data is loading...")##...it prints this message ...
                return(i) ##...and returns the inverse matrix from cache
        }
        data<-x$get() ## to set the inverse matrix into cache, it takes the matrix from makecachematrix input and assigns it to data
        i<-solve(data,...) ##this now finally calculates the inverse matrix via solve function and assigns it to i...
        x$setinv(i) ## ...puts it into cache via makecachematrix...
        i ## and prints it
}

