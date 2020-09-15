df <- read.csv('./dataset/Temperature-HeartRate.csv', header=TRUE, sep=",")

temperature <- df$temperature
heartRate <- df$heartRate


plot(heartRate,temperature, main="Temperature And Heart Rate", xlab="Heart Rate", ylab="Temperature")
abline(lm(temperature~heartRate))

cat("Pearson Correlation:",cor(heartRate, temperature ,method="pearson"),"\n")

temperature.rank <- rank(temperature)
heartRate.rank <- rank(heartRate)

cat("Spearman Correlation:",cor(heartRate.rank, temperature.rank, method="spearman"),"\n")
cat("\n")

heartRate_Normal <- scale(heartRate)
temperate_Noraml <- scale(temperature)

minmax <- function(data) {
	minimum <- min(data)
	maximum <- max(data)
	return ((data - minimum) / (maximum - minimum))
}

cat("MinMax Normalization Of Heartrate\n",minmax(heartRate),"\n")
cat("\nMinMax Normalization Of Temperature\n",minmax(temperature),"\n")