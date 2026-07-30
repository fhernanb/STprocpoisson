## Artificial example

set.seed(123)

## Number of monitoring stations
n_sites <- 4

## Number of MCMC samples
n_iter <- 50

## Maximum number of events per station
n_events <- 10

## Simulated occurrence times (sorted within each station)
data <- replicate(
  n_sites,
  sort(runif(n_events, 0, 20))
)

## Design matrices
Z <- cbind(1, rnorm(n_sites))
M <- cbind(1, rnorm(n_sites))

## Artificial MCMC output
results <- list(
  MW = matrix(abs(rnorm(n_iter * n_sites, 2, 0.2)),
              nrow = n_iter),
  Mgama = matrix(rnorm(n_iter * ncol(Z)),
                 nrow = n_iter),
  Meta = matrix(rnorm(n_iter * ncol(M)),
                nrow = n_iter)
)

## Fit the model and produce the plot for station 2
fit <- fit_goel_model(
  data = data,
  results = results,
  Z = Z,
  M = M,
  l = 2
)

## Returned values
str(fit)

## Estimated cumulative mean function
head(fit$medy1)

## Observed cumulative mean function
head(fit$mtnp)
