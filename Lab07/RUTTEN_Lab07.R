#PROBLEM 1: Fibonacci Sequence Loop
#function must return vector of the first n fibonacci numbers >=3

#include 2 arguments:function must work for any number including n<3 and 
#check imput for - or non integer #'s, returning an appropriate message

FibFunc <- function(n0=0,n){  
  if(n<=0)  {
    paste(n, "is not a positive integer")
  }
    if(n<3) {
      dataFibonacci <- c(n0,n-1)
      dataFibonacci
    }else{
    # ^ two if statements: is n a positive #? what if n<3?
    dataFibonacci <- rep(1,n) 
    dataFibonacci[1] <- n0
    for (i in 3:n) {
      dataFibonacci[i] <- dataFibonacci[i-1]+dataFibonacci[i-2]
    }
  
    return(dataFibonacci)
    #returns vector of first n in sequence
    
  }
  }
#testing it out:
FibFunc(0,2)

#PROBLEM 2: Logistic Growth
#create a function that returns log growth data + give defaults
LogGrowthFunc <- function(n=2,totGens=10,K=1000,r=0.5){
  n <- rep(n,totGens)
  for (t in 2:totGens) {
  n[t] <- n[t-1]+(r*n[t-1]*((K-n[t-1])/K))
 
  }
  plot(n, xlab="Number of Generations", ylab="Population Size" ) 
  return(n)
}

#testing it out:
LogGrowthFunc(2500,12,10000,0.8)

#PROBLEM 3:
#representing simple network data

scaryFunc1 <- function(myMatrix){
  for(i in 1:nrow){
    for(j in 1:ncol){
      if(myMatrix[i,j]!=0){
        
      }
    }
    }
}


mytestMatrix <- matrix(
  c(0,1,1,1,0,0,1,0,0),
  nrow=3,
  ncol=3)
mytestMatrix
