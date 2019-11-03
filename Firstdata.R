setwd(work_dir)
library('ggplot2')
library('forecast')
library('tseries')
library('caTools')

database = read.csv('EE627A_HW2_Q3.csv', header=F)
head(database)
dev.new()
plot(database$V1, type='l')
par(mfrow=c(1,2))
acf(database, lwd=3)
pacf(database, lwd=3)

fit = arima(database, order=c(3,1,3))
dev.new()
tsdisplay(residuals(fit), lag.max=30, main='Seasonal Model Residuals')

fit

fcast <- forecast(fit, h=100)
dev.new()
plot(fcast)
