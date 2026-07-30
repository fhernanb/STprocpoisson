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

## Artificial output from STModelGoelMCMCSA()
resultsSA <- list(
  MW = matrix(
    abs(rnorm(n_iter * n_sites, mean = 2, sd = 0.2)),
    nrow = n_iter
  ),
  Mgama = matrix(
    rnorm(n_iter * ncol(Z)),
    nrow = n_iter
  ),
  Meta = matrix(
    rnorm(n_iter * ncol(M)),
    nrow = n_iter
  ),
  Mdelta = runif(n_iter, 0.1, 1),
  Mtheta = runif(n_iter, 0.5, 2),
  Mf = runif(n_iter, 0.5, 2)
)

## Fit the Goel-SA model and produce the plot
fit <- fit_goel_modelSA(
  data = data,
  resultsSA = resultsSA,
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

