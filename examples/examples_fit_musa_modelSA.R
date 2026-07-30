# Artificial example for fit_musa_modelSA()

set.seed(123)

## Number of monitoring stations
n_sites <- 4

## Number of MCMC samples
n_iter <- 50

## Number of events per station
n_events <- 10

## Simulated occurrence times
data <- replicate(
  n_sites,
  sort(runif(n_events, min = 0, max = 20))
)

## Artificial output from STModelMusaOkumotoMCMCSA()
results <- list(
  MW = matrix(
    abs(rnorm(n_iter * n_sites, mean = 2, sd = 0.2)),
    nrow = n_iter,
    ncol = n_sites
  ),
  Malpha = runif(n_iter, min = 0.1, max = 1),
  Mdelta = runif(n_iter, min = 0.1, max = 1),
  Mtheta = runif(n_iter, min = 0.5, max = 2),
  Mf = runif(n_iter, min = 0.1, max = 1)
)

## Fit the Musa-Okumoto seasonal model
fit <- fit_musa_modelSA(
  data = data,
  results = results,
  l = 2
)

## Inspect the returned results
str(fit)

## Estimated cumulative mean function
head(fit$medy1)

## Observed cumulative mean function
head(fit$mtnp)

