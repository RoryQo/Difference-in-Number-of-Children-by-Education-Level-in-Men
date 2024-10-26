 ## <h1 align="center"> Difference in Number of Children By Education Level for Men  
       
### Table of Contents   
- [Overview](#overview)  
- [Data and Variables](#data-and-variables)  
- [Results and Methods](#results-and-methods)   
- [Conclusion](#conclusion)  

### Overview 
This project investigates the relationship between education level and the number of children for men over 30 years old. It aims to determine if there is a significant difference in the average number of children between men with and without a bachelor's degree.
 
### Data and Variables
The dataset includes observations of men over 30, detailing:
- The number of children each man has.
- Whether he possesses a bachelor's degree.

#### Variables
- $\theta_A$: Average number of children for men with a bachelor's degree.
- $\theta_B$: Average number of children for men without a bachelor's degree.

### Results and Methods
To analyze the data, a Poisson model with a weak gamma($\gamma$) prior (2,1) is utilized. This choice is made due to the right-skewed nature of the number of children, influenced by various social, economic, and biological factors.

Using Poisson sampling, 5,000 samples of  $\tilde{Y_A}$ and $\tilde{Y_B}$ are drawn from the posterior distributions for both groups. Monte Carlo approximations are applied to visualize the posterior predictive distributions.

The analysis indicates that since the prior beliefs $\gamma_A$ and $\gamma_B$ are equal, the gamma distribution centers around 1. The plots reveal that as our prior belief strengthens, the mean posterior difference between  $\theta_A$ and  $\theta_B$ decreases. Even with a weak prior, the results show minimal difference in the average number of children, suggesting that the relationship between educational attainment and number of children is not as strong as commonly perceived. This finding challenges the stereotype that less educated individuals tend to have more children.

<img src="https://github.com/RoryQo/R-Difference-in-Number-of-Children-by-Education-Level-in-Men/raw/main/Graph1.jpg" alt="Difference in Number of Children by Education Level in Men" style="width: 500px;" />


### Conclusion
The results of this analysis provide insight into the complex dynamics between education and family size. Despite expectations, the data suggests that having a bachelor's degree does not significantly correlate with the number of children a man has. This study encourages further exploration into the underlying factors influencing family size and education.
