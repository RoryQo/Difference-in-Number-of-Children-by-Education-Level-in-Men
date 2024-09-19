# Difference in Number of Children By Education Level

#### Results and Methods
Given the data, we will use a Poisson model, with a weak gamma prior of (2,1).  The means of kids will be heavily skewed right, because there are financial, cultural, and biological limits to the number of children people have, indicating we should use a gamma distribution to model this prior.  Using a Poisson model, we have more flexibility than a binomial model and relaxed assumptions, and as we have already established a relatively rare event, and it only has one parameter to create a prior for (the mean).

Using Poisson sampling I will obtain 5000 of $\tilde{Y_A}$ and $\tilde{Y_B}$ from the posterior distribution of the two samples.  Then use Monte Carlo approximations and plot the posterior predictive distributions.





#### Data and Variables
The data set contains the number of kids a man over 30 has, each row is an observed man, where it contains the number of kids and whether or not he has a bachelor's degree

+ $\theta_A$ is the average number of kids men over 30 with a Bachelor's degree
+ $\theta_B$ is the average number of kids men over 30 with a Bachelor's degree



