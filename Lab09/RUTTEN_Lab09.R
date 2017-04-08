importedData <- read.csv("~/CompBio_on_git-master/exampleData/Cusack_et_al/Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv")
#Code for finding differences in time data (which lies in column 6 of importedData)
#What we've got in column 6 is a factor, but I'm thinking it needs to be a string or maybe a vector?
#either way i set up a function to begin 

#realized I needed to name the datetime column and make it a vector
#made the column a name "DateTimeData"
DateTimeData<- importedData[,6]

#the following code makes it into a vector because they make more sense to me than strings
DateTimeDataVec <- as.vector(DateTimeData)
#testing it out to see what the new vec looks like
DateTimeDataVec

#thinking about using strptime, but I got a bunch of NA's
#Update: fixed by adding %H:%M 
StrpTimeData <- strptime(DateTimeDataVec,format="%d/%m/%Y %H:%M")
StrpTimeData

#getting the function fleshed out
veryscaryfunction <- function(starttime,endtime){
  upDatestarttime <- strptime(starttime,format="%d/%m/%Y %H:%M")
  upDateendtime <- strptime(endtime,format="%d/%m/%Y %H:%M")
  timeDif <- upDateendtime - upDatestarttime
}

#an attempt to test it out gave me an error code that said:
#Error in DateTimeDataVec$DateTime : 
# $ operator is invalid for atomic vectors
#Realizing that I gotta alter the format of my input vector so it is no longer "atomic"?

#an attempt at making the vector anything but atomic haha
DateTimeDataNumeric <- as.numeric(DateTimeData)

#changing the function to as.numerics because I keep getting an error for having atomic vectors
veryscaryfunction <- function(starttime,endtime){
  upDatestarttime <- as.numeric(strptime(starttime,format="%d/%m/%Y %H:%M"))
  upDateendtime <- as.numeric(strptime(endtime,format="%d/%m/%Y %H:%M"))
  timeDif <- upDateendtime - upDatestarttime
}
veryscaryfunction(DateTimeDataNumeric$DateTime[1], DateTimeDataNumeric$DateTime[2])

#started to think about looping to fix the error in date variables (ie, /13 vs /2013)
for(i in 1:length(importedData[,6])){
  

}

