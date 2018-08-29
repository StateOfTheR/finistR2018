######################################################
## Toy example of greta package which use TensorFlow
######################################################

rm(list=ls())

library(greta)
library(MASS)

set.seed(123)

### Data simulation
N = 20; x_true = y = rep(NA,N);
prec_x_init_true = prec_x_true = prec_y_true = 1
mean_x_init_true = 0; r_x_true = .85; r_y_true = 1
sd_y <- 1; r_x <- r_x_true
x_true[1] <- rnorm(1,mean_x_init_true, prec_x_init_true^(-0.5))
y[1] <- rnorm(1, r_y_true*x_true[1], prec_y_true^(-0.5))
for (t in 2:N){
  x_true[t] <- rnorm(1, r_x_true*x_true[t-1], prec_x_true^-0.5)
  y[t] <- rnorm(1, r_y_true*x_true[t], prec_y_true^-0.5)
}

# data --------------------------------------------------------------------
obs <- as_data(y)

# variables and priors
r_y    <- gamma(1, 1)
sd_x <- inverse_gamma(1, 1)
innovations <- normal(0, sd_x, dim = N)
latentState <- greta_array(data = 0, dim = c(N, 1))

for(t in 1:N){
  latentState[t, 1] <- sum(r_x^((t - 1) - (0:(t-1))) * innovations[1:t, 1])
}

# model definition
distribution(obs) <- normal(latentState * r_y, rep(sd_y, N), dim = N)

m <- model(latentState, r_y, sd_x, precision = 'double')

# plotting DAG
plot(m)

# # sampling
draws <- mcmc(m, n_samples = 1000)
save(draws, file = 'greta_draws.RData')
