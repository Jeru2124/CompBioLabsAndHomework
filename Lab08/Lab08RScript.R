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
