#PART I
#Lab step #3: Set Number of chip bags to object: chipAssets
#Set Number of guests to object: guestNumber
chipAssets <- 5
guestNumber <- 8

#Lab step #5: Set Percentage of chip bag consumed per 1 guest: chipExpensePerGuest
chipExpensePerGuest <- 0.4

#Calculate number of chips left over if eaten by guests and assign to object
chipsLeftOver <- chipAssets- (guestNumber*chipExpensePerGuest)
chipsLeftOver

#Calculate number of chips left over if consumed by guests + host and assign to object
chipsLeftOverIncludingHost <- chipAssets- ((guestNumber+1)*chipExpensePerGuest)
chipsLeftOverIncludingHost


#PART II
#Using "objectname <- c(list of values)" ,Create 5 vectors for ratings recieved per Star Wars Episode
Self <- c(7,6,5,1,2,3,4)
Penny <- c(5,7,6,3,1,2,4)
Jenny <- c(4,3,2,7,6,5,1)
Lenny <- c(1,7,3,4,6,5,2)
Stewie <- c(6,7,5,4,3,1,2)

#Index position with square brackets vectorObjectName[#elementWeWantToIndex]
PennyIV <- Penny[4]

LennyIV <- Lenny[4]

#Concatination of each ranking vector is executed with cbind()
concatOfRankings <- cbind(Self,Penny,Jenny,Lenny,Stewie)

#Use str() command to inspect the structure of a previous object
str(PennyIV)

#Two potential commands (fairly identical) for composing a data frame
allRankingsinDataFrame <- data.frame(concatOfRankings)
as.data.frame(concatOfRankings)
#data.frame() command is more compact than cbind(), but it appears that cbind() must be assigned to an object before data.frame(objectname) is used

#compile string of Episode names as Roman Numerals
StringofEpisodeNum <- c("I","II","III","IV","V","VI","VII")

#Assign string to column names via colnames() , row names can be editted via row.names()
row.names(concatOfRankings) <- StringofEpisodeNum
concatOfRankings

#Access 3rd row, then 4th column from final data set matrix (rows can be accessed via matrixname[row#,] ,columns can be accessed via matrixname[,column#])
concatOfRankings[3,]
concatOfRankings[,4]
concatOfRankings[5,1]
concatOfRankings[2,2]
concatOfRankings[4:6,]
concatOfRankings[c(2,5,7),]
concatOfRankings[c(4,6),c("Penny","Jenny","Stewie")]

#NOTE range of things specified via colons " : " and a nonchronological list via c(x,y,z)

#Say we wanna swap the following two values, row2 and row 5 for column 4
concatOfRankings[2,4] #allRankings["II","Lenny"] can also be used
concatOfRankings[5,4] #allRankings["V","Lenny"] can also be used

old <- concatOfRankings["II","Lenny"]
concatOfRankings["II","Lenny"] <- concatOfRankings["V","Lenny"]
#test to see if old has been replaced
concatOfRankings["II","Lenny"]
#put old into the other spot
concatOfRankings["II","Lenny"] <- old
#test it out!
concatOfRankings["V","Lenny"]
concatOfRankings["II","Lenny"]

#Now using a different method, swap variables back (this method only works in data.frames)
allRankingsinDataFrame$Lenny
typeof(concatOfRankings)

