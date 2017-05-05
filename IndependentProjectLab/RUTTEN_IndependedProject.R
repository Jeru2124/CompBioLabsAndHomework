#Read csv file

DataCsv <- read.csv("~/Courses/EBIO4420CompBio/CompBioLabsAndHomework/IndependentProjectLab/SymondsTattersall.csv")
#I was getting an "invalid graphics state" error after finalizing the read.csv. To fix I used the following code:
#It works well on my laptop.
dev.off()


#PART I: Create objects from data to use in code 

#Specifying column numbers of interest
colnumofBodyMass <- 4
colnumofBillLength <- 5
colnumbofTemp <- 11
#Creating Body Mass object
lengthcolBodyMass <- length(DataCsv[,colnumofBodyMass])
BodyMassVector <- DataCsv[1:lengthcolBodyMass,colnumofBodyMass]
BodyMassVector
 #Creating Bill Length object
lengthcolBillSize <- length(DataCsv[,colnumofBillLength])
BillLengthVector <- DataCsv[1:lengthcolBillSize,colnumofBillLength]
BillLengthVector
#Creating Temp object
lengthcolTemp <- length(DataCsv[,colnumbofTemp])
TempVector <- DataCsv[1:lengthcolTemp,colnumbofTemp]
TempVector

#PART II: Establish ratio of body mass to bill length

ProportionRatio <- (BodyMassVector/BillLengthVector)
#Larger value = More "compact" body type
ProportionRatio
#Proportion Ratios for each species are paired with their Regional Minumum Temperatures in a matrix
matrixofPropsTemps <- cbind(ProportionRatio,TempVector)
matrixofPropsTemps

#PART III: Linear regression

#to use lm() data must be in a dataframe
#The lm() function outputs include data that creates 5 graphs.The first is a linear regression that 
#does not logartithmically transform the proportions ratio. The other 4 graphs provide an analysis
#of how each data point affects the trend line by measuring the influence of outliers within the data.
#The Normal Q-Q plot illustrates the degree to which the data is normally distributed.
dfofPropTemps <- na.omit(as.data.frame(matrixofPropsTemps))
plot(matrixofPropsTemps)
linreg <- lm(formula = log(ProportionRatio) ~ TempVector, data = dfofPropTemps)
plot(linreg)
#the lm() function runs through each plot with <Return> command, so the next blank lines allow
#each plot to output. 



#The Proportions Ratio is logarithmically transformed to better illustrate the indirect correlation between
#temperature and body proportion
y <- log(dfofPropTemps$ProportionRatio)
plot(dfofPropTemps$TempVector, y, xlab="Temperature (C)", ylab="log(Proportions Ratio)", cex.main=0.75, main="Linear Regression of log(Body Proportions Ratios) to Minimal Regional Temperatures (C)")
lines(sort(dfofPropTemps$TempVector), fitted(linreg)[order(dfofPropTemps$TempVector)], col="red", lwd=2)

#PARTIV: Create a grid representing theoretical landscape and a coordinating species grid

#establish max and min of possible temps
maxTemp <- TempVector[which.max(TempVector)]
minTemp <- TempVector[which.min(TempVector)]
#Create matrix of 10 replicates of potential temperatures that include the minimum and maximum temps in the data
vecofTempGradient <- seq(from = minTemp-1, to = maxTemp+1, by = 0.5)
matrixofTempGradient <- matrix(rep(vecofTempGradient,10), nrow=length(vecofTempGradient), ncol=10)
matrixofTempGradient
#transposing heat color gradient to appropriately coincide with data
mycols <- heat.colors(15, 0.25 )[seq(15,1,-1)]

#make storage matrix for species in theoretical landscape
matrixofSpecies <- matrix(rep(0,10), nrow=length(vecofTempGradient), ncol=10)
matrixofSpecies

#PART V: Start the probability loop! Store data in species grid

#Define the species "ID" (must be an integer between 1:214) to be gridded as the object"focalSpecies".
focalSpecies <- 27
#Loop through each value in the temperature matrix, create an object Pijk that describes how close the 
#species given temp is to the theoretical matrix temp and if that value meets the
#requirement given in line 83, add a "1" to the corresponding position in the species storage matrix.
#The resulting species matrix will display "presence and absence" data based on the probability that a 
#species will exist at the given temperature, with 10 replicates.
for(i in 1:990) {
  Pijk <- 1/abs(TempVector[focalSpecies]-matrixofTempGradient[i])
#If the uniform distribution (according to body proportions) given by the runif() function is 
#less than the calculated probability given by Pijk, add a "1" to the corresponding place in the matrix.
  if(runif(n=1) < Pijk) {
    matrixofSpecies[i] <- 1
  }
}
matrixofSpecies
#Image the matrix, and pair the species matrix with the temperature matrix to display a 
#temperature gradient background.
image(matrixofSpecies, col=grey(seq(1, 0, length = 2)), axes=FALSE)
par(new=TRUE)
title <- paste("Probable Temperatures(C) that Focal Species ID=", focalSpecies, "could Theoretically Occupy")
image(matrixofTempGradient, col=mycols, axes=FALSE, xlab="Temperature (C)", ylab="Stochastic Replicates", cex.main=0.75, main=title)
#Add custom axes that coincide with data
axis(side=1, at=c(0,0.5,1), labels=c("-19","10","29"))
axis(side=2, at=c(0,0.5,1), labels=c("1","5","10"))

