## Evidence for Allen's Rule in Aves: Modeling Theoretical Temperature Gradients for Species of Birds given Morphological Proportions

####**Biological question**

Does the class Aves show evidence for Allen's rule across multiple species and how does the probability that a species of Aves could exist at a specific climate change across a temperature gradient, given specific morphological proportions?

####**Context and Introduction**

Evolutionary biologists use Allen’s rule as an explanation for patterns in animal morphology that appear to coordinate with certain climates. A maximization of an organism's external surface area facilitates heat-loss in climates with higher regional temperatures. Conversely, a minimization of body surface area allows for insulation in colder locations. 

Finding and modeling evidence for Allen’s rule via computation aids in our understanding of the relationship between morphological form and function. This project utilizes a theoretical gradient of minimal regional temperatures to illustrate how the probability of existence for a given species varies across the gradient depending on its body morphology. 

####**Methods**

*Source of the data:*
Symonds MRE, Tattersall GJ (2010) Geographical variation in bill size across bird species provides evidence for Allen’s rule. American Naturalist 176: 188-197. http://dx.doi.org/10.1086/653666

*Dryad Data Package:*
Symonds MRE, Tattersall GJ (2010) Data from: Geographical variation in bill size across bird species provides evidence for Allen’s rule. Dryad Digital Repository. http://dx.doi.org/10.5061/dryad.1421

The data retrieved from [Symonds and Tattersall](http://datadryad.org/resource/doi:10.5061/dryad.1421) includes geographical, morphological, and habitat information for 215 species of Aves, across eight families. 

The authors Symonds and Tattersall compiled the data from separate primary sources, referenced for each species in column number 12 of the csv file of interest. The 69.0KB file includes 215 species entries, each with a family, genus, and species name. Each single row holds a separate, unique species. Column headers describe averages of the following measurements:  
> Body mass, Bill length, Tarsus length, Middle Toe length, Tarsometatarsus+middle toe length, Midpoint latitude (degrees from equator), Midpoint altitude, & Minimum temperature at midpoint of range (Celsius)

Body mass, minimum temperature at midpoint of species range, and taxonomical names are the only columns that are relatively complete for this data set. There is data missing in variously sized patches for many of the species in all other categories. Otherwise, all data is numerical, not including the organisms taxonomy.


*Author's Use of the Data:*

The authors performed phylogenetic comparative analyses of each species in order to determine whether beak size serves as a significant location for heat exchange, as suggested by Allen's rule. Using the package COMPARE , they performed phylogenetic generalized least squares (PGLS). Data for each family was subject to PGLS and the authors determined that limb length plays a lesser role in thermoregulation than beak length. The authors, accordingly, determined that colder climates correlate with significantly smaller beak lengths. They discovered evidence to suggest that Allen's rule has played a key part in determining the evolution of beak morphology. 

*My Use of the Data:*

I determined that I needed to design a measure of morphological "compactness" from the values of average body mass and bill length, in order to observe a correlation between body proportions and minimal regional temperature.  After assigning each key column to an object name, I divided the column "Body mass" by the column "Bill Length" in order to create a ratio that would quantify body proportionality. A larger value of the proportion ratio signifies a more compact body type, which Allen's rule hypothesizes to occupy colder climates. I then paired the ratio for each species with its corresponding average minimal regional temperature in a 2 dimensional matrix. 

I performed a linear regression on the Temperature/Proportions Ratio matrix to produce five graphs using the function lm(). I determined that a logarithmic transformation of the ratio vector would be required to normalize outliers in the linear regression, just as the authors had originally done within their study. The first graph did not perform a logistic transformation on the data and had to be discarded and reattempted outside of the lm() function in lines 54-56, in order to include the log transformation. The other four graphs produced via the lm() function illustrate how each data point affects the trend line produced by measuring the influence each point has on the trend line itself. A Normal Q-Q plot was also produced with this function to describe the degree to which the data set is normally distributed.

I created 2 storage matrices before proceeding: one to store a theoretical temperature gradient, the other to store species' "presence and absence" data produced by a for-loop. The temperature gradient was generated after determining the minimum and maximum temperatures that the temperature vector from the csv file included. I then produced a vector with a length of 99 filled with temperatures between the minimum and maximum temperatures and greated 10 replicates of the gradient vector to produce a matrix. The species absence and presence matrix has matching length/dimensions to the temperature gradient matrix and is comprised soley of zeros in order to signify an empty model. I then created an object to indicate the focal species ID (an integer between 1 and 215) whose model will be generated by the for-loop. 

After specifying the focal species to be modeled, I produced a for-loop that runs through the theoretical temperature gradient matrix and creates an object, Pijk, for each value in the matrix. Pijk describes the quotient of 1 over the absolute value of the difference between the ideal species temperature and the temperature at the given point in the matrix. This value describes how far the focal temperature in the gradient deviates from the ideal minimal temperature at which the species is observed. A larger Pijk value asserts that the gradient temperature is closer to the ideal, relative to a smaller Pijk value. The loop then determines whether the Pijk value is larger than a value produced by a stochastic uniform distribution generator, runif(). If the Pijk value is indeed larger, a "1" is added to the theoretical temperature gradient matrix. Otherwise, the space at the given temperature remains a "0".

The produced matrix of absence/presence data was imaged and combined with the imaged matrix of the theoretical temperature grid to illustrate how the probability that a species exists at a given climate varies along the temperature gradient. The loop can thus be run several times for different focal species by altering the value assigned to the object, focalSpecies, and their graphs can be compared.


####**Results and conclusions**

What did you find? How does this relate to your question? Include at least one visualization.

The runif() function allows for a stochastic element to my model, in order to illustrate that a given body type does not necessarily prevent a specific body type from appearing at a given temperature; instead, the probability of existence of a given body type decreases as one moves further from the ideal minimal temperature. The following graphs depict various generated matrices produced by the loop for different species.
![screenshot](https://raw.githubusercontent.com/Jeru2124/CompBioLabsAndHomework/master/IndependentProjectLab/TheoreticalTempGradientSp27.jpeg)
The logistic regression produced the hypothesized trendline that body surface area increases with temperature, as suggested by Allen's Rule. Theoretical-gradient modeling provides a viable visualization of the probabilities that a species exists under given conditions. Across all possible matrices produced and imaged, it is clear that as one moves away from the ideal temperature for a given species body type, the liklihood that the body type will exist at said temperature begins to decrease. Allen's Rule is supported by these results. The implications of my project suggest that if climate change pushed a temperature farther from the ideal temperature for a given morphology, a species will be inclined to alter its body type in order to improve thermoregulation efficiency. If the population is not able to evolve its morphology to match the altered climate, the species risks considerable decline in fitness. 


####**References**
Symonds MRE, Tattersall GJ (2010) Geographical variation in bill size across bird species provides evidence for Allen’s rule. American Naturalist 176: 188-197. http://dx.doi.org/10.1086/653666
