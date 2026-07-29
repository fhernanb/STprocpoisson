# Load the dataset
data(sites)

# View the structure of the data
str(sites)

# Plot the geographic locations of the rain gauge stations
plot(sites$longitude, sites$latitude, pch = 16, col = "blue",
     xlab = "Longitude", ylab = "Latitude",
     main = "Rain Gauge Stations in Maranhão and Piauí")
