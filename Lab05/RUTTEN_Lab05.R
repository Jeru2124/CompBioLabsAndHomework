#Check to see if x is greater than 5. Print message accordingly
x <- 4
if (x>5) {
  print("x is greater than 5")
} else {"x is not greater than 5"
}


Vector1 <- read.csv("~/Courses/EBIO4420CompBio/CompBioLabsAndHomework/Lab05/Vector1.csv")
for(i in 1:2024) {
  if ((Vector1[i,1])<0) {
    Vector1[i,1] <- NA
     }
}

#Check to see if replacement from "-" values to "NA" worked
NAindices <- which( is.na(Vector1))

#Creating a new Vector that has values from Vector1 that fall between 50 and 100
#note that no loop is needed. Using which gives indices, and you can use those indices to call for the specific values
newVector1 <- which((Vector1[,1]<=100 & Vector1[,1]>=50))
newVector1 <- Vector1[newVector1,1] 
newVector1

#Using CO2Data, find the first year Gas emissons = nonzero
CO2Data <- read.csv("~/Courses/EBIO4420CompBio/CompBioLabsAndHomework/Lab04/CO2_data_cut_paste.csv")
NonZeroGasEmission <- which(CO2Data[,3]>0)
Firstyear<- CO2Data[NonZeroGasEmission[1],1]
Firstyear

#Using CO2Data, find years where 200<=Totvalue<=300
IndexfromTot <- which(CO2Data[,2]>=200 & CO2Data[,2]<=300)
IndexfromTot
ValuesfromTot <- CO2Data[IndexfromTot,1]
ValuesfromTot

#Predator Prey modeling Parameters
totalGenerations <- 1000
initPrey <- 100     # initial prey abundance
initPred <- 10      # initial predator abundance
a <- 0.01       # attack rate
r <- 0.2        # growth rate of prey
m <- 0.05       # mortality rate of predators
k <- 0.1        # conversion constant of prey into predators

#Make vectors for placeholding and time
time <- (1:1000)
nExtraVec <- rep(initPrey,1000)
pExtraVec <-rep(initPred,1000)

#Run loop to model pop changes over 1000 generations
for (i in 2:1000) {
  nExtraVec[i] <- initPrey + (r * initPrey) - (a * initPrey * initPred)
  pExtraVec[i] <- initPred + (k * a * initPrey * initPred) - (m * initPred)
  if (pExtraVec[i]<0) {
    pExtraVec[i] <- 0
  }
  if (nExtraVec[i]<0) {
  nExtraVec[i] <- 0
  }
  initPrey <-nExtraVec[i] 
  initPred <-pExtraVec[i] 
}

plot(time,nExtraVec)
lines(time,nExtraVec)
lines(time,pExtraVec)
