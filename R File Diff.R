## ----echo=F--------------------------------------------------------
# Data given
Y_a <- c(1, 0, 0, 1, 2, 2, 1, 5, 2, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 2, 1, 3, 2, 0, 0, 3, 0, 0, 0, 2, 1, 0, 2, 1,
0, 0, 1, 3, 0, 1, 1, 0 ,2, 0, 0, 2, 2, 1, 3, 0, 0, 0, 1, 1)
Y_b <- c( 2, 2, 1, 1, 2, 2, 1, 2, 1, 0, 2, 1, 1, 2, 0, 2, 2, 0, 2, 1, 0, 0, 3, 6, 1, 6, 4, 0, 3, 2, 0, 1, 0, 0, 0, 3, 0, 0, 
0, 0, 0, 1, 0, 4, 2, 1, 0, 0, 1, 0, 3, 2, 5, 0, 1, 1, 2, 1, 2, 1, 2, 0, 0, 0, 2, 1, 0, 2, 0, 2, 4, 1, 1, 1,
2, 0, 1, 1, 1, 1, 0, 2, 3, 2, 0, 2, 1, 3, 1, 3, 2, 2, 3, 2, 0, 0, 0, 1, 0, 0, 0, 1, 2, 0, 3, 3, 0, 1, 2, 2, 2,
0, 6, 0, 0, 0, 2, 0 ,1, 1, 1, 3, 3, 2, 1, 1, 0, 1, 0, 0, 2, 0, 2, 0, 1, 0, 2, 0, 0, 2, 2, 4, 1, 2, 3, 2, 0, 0,
0, 1, 0, 0, 1, 5, 2, 1, 3, 2, 0, 2, 1, 1, 3, 0, 5, 0, 0, 2, 4, 3, 4, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 2, 0, 0, 1, 1, 0, 2, 1, 
3, 3, 2, 2, 0, 0, 2, 3, 2, 4, 3, 3, 4, 0 ,3 ,0 ,1 ,0, 1, 2, 3, 4, 1, 2, 6, 2, 1, 2, 2)


## ------------------------------------------------------------------
# Descriptive Stats
n_a = length(Y_a)
n_b = length(Y_b)
ybar_a = mean(Y_a)
ybar_b = mean(Y_b)

# Set param values
a_theta = 2
b_theta = 1
S = 5000
ab_gamma = c(8, 16, 32, 64, 128)


## ------------------------------------------------------------------
theta_diff = sapply(ab_gamma, function(abg) {
 a_gamma = b_gamma = abg
 THETA = numeric(S)
 GAMMA = numeric(S)
# Starting values
theta = ybar_a
# Relative rate theta_B /theta_A
gamma = ybar_a / ybar_b 
# For each value in s (5,000) create a theta with gamma(1,...)
# Then create a a gamma (1,...)
 for (s in 1:S) {
 theta = rgamma(
 1,
 a_theta + n_a * ybar_a + n_b * ybar_b,
 b_theta + n_a + n_b * gamma
 )
 gamma = rgamma(
 1,
 a_gamma + n_b * ybar_b,
 b_gamma + n_b * theta
 )
 THETA[s] = theta
 GAMMA[s] = gamma
 }
# Reconstruct theta_ and theta_B
 THETA_A = THETA
 THETA_B = THETA * GAMMA
 mean(THETA_B - THETA_A)
})


## ------------------------------------------------------------------
# Plot
plot(x = ab_gamma, y = theta_diff, xlab = "ab_gamma", ylab = "theta_diff", pch=19, lwd=2, col="darkgreen", type="b")


