# Load the dataset
data(series)

# View the dimensions of the matrix
dim(series)

# Summary of precipitation for the first location
summary(series[, 1])

# Plot precipitation for the first location
plot(series[, 1], type = "l",
     xlab = "Days", ylab = "Precipitation (mm)",
     main = "Daily Precipitation at Location 1")
