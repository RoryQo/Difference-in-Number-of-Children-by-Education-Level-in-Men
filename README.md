# <h1 align="center"> Difference in Number of Children By Education Level for Men    

### Table of Contents    
- [Overview](#overview)     
- [Data and Variables](#data-and-variables)  
- [Methodology](#methodology)     
- [Interpretation of Results](#interpretation-of-results)  
- [Conclusion](#conclusion)   

## Overview 
This project investigates the relationship between education level and the number of children for men over 30 years old. It aims to determine if there is a significant difference in the average number of children between men with and without a bachelor's degree.
 
## Data and Variables
The dataset includes observations of men over 30, detailing:
- The number of children each man has.
- Whether he possesses a bachelor's degree.

### Variables
- **$\theta_A$**: Average number of children for men with a bachelor's degree.
- **$\theta_B$**: Average number of children for men without a bachelor's degree.

---

## Methodology

### 1. Bayesian Poisson Model

Since the number of children is right-skewed due to external social, economic, and biological factors, we analyze the data with a **Poisson distribution** due to its suitability for count data. A **gamma prior** is chosen due to its conjugacy with the Poisson likelihood.

The model is defined as follows:

```math
Y_A \sim \text{Poisson}(\theta_A), \quad Y_B \sim \text{Poisson}(\theta_B)
```

where  
- **$Y_A$**: Number of children for men with a degree  
- **$Y_B$**: Number of children for men without a degree  

The prior for **θ** follows a **Gamma(a, b) distribution**:

```math
\theta_A, \theta_B \sim \text{Gamma}(2,1)
```
Using Poisson sampling, 5,000 samples of  $\tilde{Y_A}$ and $\tilde{Y_B}$ are drawn from the posterior distributions for both groups. Monte Carlo approximations are applied to visualize the posterior predictive distributions.

<img src="https://github.com/RoryQo/Difference-in-Number-of-Children-by-Education-Level-in-Men/raw/main/graph2.jpg" alt="Rat Lab Graph" style="width: 450px;" />

### 2. Model Assumption Checks

#### **2.1 Overdispersion Check**
A key assumption of the Poisson model is that the mean and variance of the data should be approximately equal. Overdispersion occurs when the variance significantly exceeds the mean, which may indicate the need for an alternative model (e.g., **negative binomial regression**).  

We compute the **dispersion statistic**:  


```math
D = \frac{\sum \text{Pearson residuals}^2}{\text{Degrees of freedom}}
```

```
dispersion_stat <- sum(residuals_pearson^2) / model$df.residual
```


Results:  
- **For men with a degree:** Dispersion = **1.28**  
- **For men without a degree:** Dispersion = **1.37**  

Since both values are slightly greater than 1, we detect **mild overdispersion**, meaning additional unobserved factors might influence family size.

#### **2.2 Histogram of Monte Carlo t-Statistics**
To further check if the model appropriately fits the data, we simulate **Monte Carlo samples** of the t-statistic:

```math
t = \frac{\bar{Y}}{\text{SD}(Y)}
```

Histograms of the simulated t-statistics for both groups are plotted alongside the observed t-statistic to ensure that the distribution of simulated values aligns with the observed data.

<div>
<img src="https://github.com/RoryQo/Difference-in-Number-of-Children-by-Education-Level-in-Men/raw/main/degreefit.jpg" alt="Rat Lab Graph" style="width: 450px;" />
<img src="https://github.com/RoryQo/Difference-in-Number-of-Children-by-Education-Level-in-Men/raw/main/nodegreefit.jpg" alt="Rat Lab Graph" style="width: 450px;" />
</div>
---

### 3. Model Diagnostics  

#### **3.1 Residual Analysis**
To assess the model fit, we examine:
- **Pearson residuals vs. fitted values**: Checks for patterns that might indicate poor fit.
- **Deviance residuals vs. fitted values**: Measures goodness of fit.
- **QQ plot of residuals**: Assesses normality of residuals.

The residual plots do not indicate severe violations of model assumptions, though some mild dispersion suggests additional variance not captured by a simple Poisson model.

---

## Interpretation of Results  

### **Credible Interval for $\theta_B - \theta_A$**

```
theta_samples_a <- rgamma(5000, 2 + sum(Y_a), 1 + length(Y_a))
theta_samples_b <- rgamma(5000, 2 + sum(Y_b), 1 + length(Y_b))

theta_diff_samples <- theta_samples_b - theta_samples_a
quantile(theta_diff_samples, probs = c(0.025, 0.5, 0.975))  # 95% credible interval
```

A **95% credible interval** for the difference in average number of children between groups is:

\[
(0.15, 0.74)
\]

Since this interval does not include zero, we conclude that men without a bachelor's degree tend to have more children than those with a degree. However, the effect size is modest.

### **Implications of Overdispersion**
The mild overdispersion suggests that factors beyond education level—such as socioeconomic status, cultural norms, or relationship status—may also influence family size. Future research could explore alternative models, such as a **negative binomial regression**, to account for this additional variation.

---

## Conclusion
This study finds that education level has a modest association with the number of children men have, with those without a bachelor's degree tending to have slightly more children on average. However, the effect is not as strong as commonly assumed, and mild overdispersion suggests that additional factors contribute to family size differences. Further research incorporating socioeconomic and cultural variables may provide a more comprehensive understanding of the relationship between education and fertility.
