#LAB 12: Stochastic Problems

#Parameters: used to model logistic growth
r <- 0.1
K <- 100
gens <- 100
n_init <- 10

#Part 1:Create Function that simulates stochastic model of pop growth:
#Death and Birth events=stochastic,pop size from gen N to gen N+1 is a Poisson distribution
#where lambda is n[t+1] every distribution in the loop through "gens" generations
StochasticPopFunc <- function(r=0.1,K=100,gens=100,n_init=10){
  n <- rep(n_init,gens)
  for(t in 2:gens){
    expectedVal <- n[t-1]+(r*n[t-1]*((K-n[t-1])/K))  
  realizedVal <- rpois(n=1 , lambda=expectedVal)
  n[t] <- realizedVal
  }
  return(n)
}
n <- StochasticPopFunc(r,K,gens,n_init)

#Part 2: Plot the results of the function
plot(n, xlab="Number of Generations", ylab="Abundance", type="l")

#Part 3
#i) calculate the prob that popsize does not change from n[1] to n[2]
expectedVal <- n[1]+(r*n[1]*((K-n[1])/K)) 
i <- dpois(n[1], expectedVal)

#ii) calculate the prob that popsize shrinks from n[1] to n[2]
ii <- ppois(n[1]-1, expectedVal)

#ii) calculate the prob that popsize increases from n[1] to n[2]
iii <- ppois(n[1], expectedVal, lower.tail=FALSE)

#Check that you've exhaused all probabilities! i+ii+iii should= 1
i+ii+iii

#iv) calculate the  probability that n[2] is between 15 and 25
#can be calculated via difference between probability that n[2] < 25 & probability that n[2] < 15
iv <- ppois(25, expectedVal) - ppois(14, expectedVal)

#v) calculate the probabilty that the population goes extinct at n[2]
v <- ppois(0,expectedVal)

#Part 4:
#Expectations of Long-run average: The model should roughly follow logistic growth, 
#if all possibilities including stochasticity are summed

#Part 5: Write a function that creates and stores replicates of Part1's function
#Parameters:
r <- 0.1
K <- 100
gens <- 100
n_init <- 10
replicates <- 100
RepStochPop <- function(r=0.1,K=100,gens=100,n_init=10,replicates=100){
  n <- rep(n_init,gens)
  m <- rep(n_init,replicates)
  for(t in 2:gens){
    expectedVal <- n[t-1]+(r*n[t-1]*((K-n[t-1])/K))  
    realizedVal <- rpois(n=1 , lambda=expectedVal)
    n[t] <- realizedVal
  }
  return(n)
  replicatematrix <- c(m)
  
}
n <- StochasticPopFunc(r,K,gens,n_init)
RepStochPop()
