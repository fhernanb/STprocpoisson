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

## Artificial MCMC output
results <- list(
  MW = matrix(
    abs(rnorm(n_iter * n_sites, mean = 2, sd = 0.2)),
    nrow = n_iter
  ),
  Malpha = runif(n_iter, 0.1, 1)
)

## Fit the Musa-Okumoto model and produce the plot
fit <- fit_musa_model(
  data = data,
  results = results,
  l = 2
)

## Returned values
str(fit)

## Estimated cumulative mean function
head(fit$medy1)

## Observed cumulative mean function
head(fit$mtnp)
