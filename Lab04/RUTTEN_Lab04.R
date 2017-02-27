#Part I: Practice Writing "for loops"
for (i in 1:10) { 
  print ("hi") 
  }

piggyBank <- 10
allowance <- 5
gum <- 1.34
for (i in 1:8) {
  x <- piggyBank+allowance-2*gum
  piggyBank <- x
  print (x)
  piggyBank <- x
  }

popSize <- 2000
popShrink <- popSize*0.05
for (i in 1:7) {
  p <- popSize-popShrink
  print (p)
  popSize <- p
  popShrink <- popSize*0.05
  }

n <- 2500
K <- 10000
r <- 0.8
for (t in 1:12) {
  n <- n+(r*n*((K-n)/K))
  print (n)
  }

data1b <- rep(0,18)
data1b
for (i in seq(1,18)) {
  data1b[i] <- (3*i)
  }
data1b
  
data1c <- rep(0,18)
data1c
data1c[1] <- 1
data1c

data1d <- data1c
for (i in 2:18) {
  data1d[i] <- 1+(2*(data1d[i-1]))
  }
data1d


dataFibonacci <- rep(1,20)
for (i in 3:20) {
  dataFibonacci[i] <- dataFibonacci[i-1]+dataFibonacci[i-2]
}
dataFibonacci

n <- 2500
K <- 10000
r <- 0.8
for (t in 1:12) {
  n <- n+(r*n*((K-n)/K))
  print (n)
}
time <- 1:12


CO2_data_cut_paste <- read.csv("~/Courses/EBIO4420CompBio/CompBioLabsAndHomework/Lab04/CO2_data_cut_paste.csv")


for (i in 2:263) {
  firstValue <- CO2_data_cut_paste[i,2:7]
  for (i in 2:263)
    p <- CO2_data_cut_paste[i,(2:7)-1]
  secValue <- CO2_data_cut_paste[i,p]
  q <- firstValue/secValue
  print(q)
}
