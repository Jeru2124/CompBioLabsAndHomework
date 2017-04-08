#Some Background...
#Generating numbers via binomial distributon can be used with the function
#rbinom(n, size, prob) where n=#replicates 

#EXCERSIZE A: Binomial distribution
#A1
rbinom(1,10,0.5)
rbinom(8,10,0.5)
#function output=# of successes 
#(can be in a vector of trials (ie, 10 flips per trial w 8 trials) given the provided parameters 
#will vary when you run the function! Simulates an actual coin flip

#A2
rbinom(1,20,0.15) #20 people, 15% chance of being ill if vaccinated
#A3
rbinom(1,20,0.40) #20 people, 40% chance of being ill if unvaccinated
#A4
vaccinated <- rbinom(30,20,0.15)
unvaccinated <- rbinom(30,20,0.40)
hist(vaccinated)
hist(unvaccinated)
#histogram of unvaccinated people shifts to the right 
#(mean of sick people increases with a lack of vaccinations)

#A5
aAlleles <- rbinom(1,500,0.55)
aAlleles/500 #ratio of success outcomes over total pop gives frequency of successes 

#A6
#some parameters before the forloop
initprob <- 0.55
gens <- 1000
vectorOfA <- rep(initprob,gens)
MatrixOfAreps <- matrix(vectorofA, nrow)
pop <- 500

for(i in 2:gens){
  aAlleles <- rbinom(1,pop,vectorOfA[i-1]) #i-1 is in place to assure the parent of i is i-1
  vectorOfA[i] <- aAlleles/pop
}
vectorOfA

#A7
plot(vectorOfA,type="l") #"l" connects the dots

#A8
for(i in 2:gens){
  aAlleles <- rbinom(1,pop,vectorOfA[i-1]) #i-1 is in place to assure the parent of i is i-1
  vectorOfA[i] <- aAlleles/pop
  for(j in 1:1000){
    
  }
}
vectorOfA

plot(which(vectorOfA[,1000]>0))


