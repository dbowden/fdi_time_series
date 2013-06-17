#Some preliminary analyses

#install.packages("forecast")
library(forecast)
#install.packages("TSA")
library(TSA)
#install.packages("ggplot2")
library(ggplot2)
#install.packages("plm")
library(plm)

#load data
fdi <- read.csv("fdits.csv")

#angola was one of our cases, let's take a look
#auto.arima function will tell us the proper baseline specification
ang  <- subset(fdi,ccode==540)
ang.int <- levels(as.factor(ang$startYear))
ang.int  <- ang.int[-c(1:4)]

ggplot(ang, aes(ang$year,ang$ForeigndirectinvestmentnetinflowsofGDP)) + geom_line() + ggtitle("FDI to Angola") + xlab("Year") + ylab("FDI (% GDP)") + geom_vline(xintercept=(as.numeric(ang.int)), color="red")

auto.arima(ang$ForeigndirectinvestmentnetinflowsofGDP)
