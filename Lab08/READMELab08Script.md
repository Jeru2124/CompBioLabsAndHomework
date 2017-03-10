##Lab08 Script
####Function of Discrete-Time Logistic Growth Model
_____________
This script encodes a function displaying logistic Growth with the given information:
>n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )  
>
>n[t]: "abundance"
>t: "time (number of generations)"
>r: "intrinsic growth-rate of population"
>K: "carrying capacity"

The script includes 

 - Code for the function, including plot
 - Test of the function resulting in data
 - Code that writes the resulting data in a csv file: _dataForLab08.csv_
 
####Parameters
The data resulting from the function includes parameters as follows:
>n[0] <- 2500
>t <- 12
>r <- 0.8
>K <- 1000

The instructions for Lab08 are on [github](https://github.com/flaxmans/CompBio_on_git/blob/master/Labs/Lab08/Lab08_documentation_and_metadata.md)
