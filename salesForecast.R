library(lubridate)
library(caret)
library(dplyr)
library(ggplot2)
library(gridExtra)
library(data.table)
library(forecast)
library(aTSA)

test <- 'your path'
file_test <- fread(test, sep=",",header = T)

item <- 'your path'
item_test <- fread(item, sep=",",header = T)

category <-'your path'
item_category <- fread(category, sep=",",header = T)

shops <-'your path'
shops_file <- fread(shops, sep=",",header = T)

sales_train <-'your path'
sales <- fread(sales_train, sep=",",header = T)
##############################################

str(file_test)
str(item_test)
str(shops_file)
str(sales)
apply(item_test,2, function(x) length(unique(x)))

#joing tables item_id from table items to table sales
newFile <- sales%>%
  left_join(item_test, by=c("item_id"))

#removing item_name from the table.
newFile$item_name <- NULL

#looking for missing values on dataset
colSums(is.na(newFile))
#looking for empty data
colSums(newFile=='')

#Removing negative values
newFile$item_cnt_day[newFile$item_cnt_day<0] <-0

#checking for negative values
newFile[colSums(newFile < 0) == 0,] 


#splitting the date into: day, month, and year.
newFile$date=dmy(newFile$date)
newFile$month=month(newFile$date)
newFile$year=year(newFile$date)
newFile$day=weekdays(newFile$date)

newFile$day=as.factor(newFile$day)
newFile$month=as.factor(newFile$month)
newFile$year=as.factor(newFile$year)
######################################

glimpse(newFile)
summary(newFile)

#Creates Variable that gets the profit
newFile['Sum_Item'] <-newFile$item_price*newFile$item_cnt_day 

#Removes the negative values
newFile$Sum_Item[newFile$Sum_Item<0] <-0

#Gets the revenue per month by year                 
Monthly_Revenue<-newFile %>%
  group_by(month=format(newFile$date, "%Y-%m"), year) %>%
  summarise(total_sales = sum(Sum_Item))

###Getting a training data of 24 observations
Monthly_Revenue2<-head(Monthly_Revenue,24)

###Data to create the forecast
testData <-tail(Monthly_Revenue,10)


#Creating the time series
set.seed(123)
myts <-ts(Monthly_Revenue2$total_sales, start=c(2013,1), end=c(2014,12), frequency=12)

######Visual inspection

Acf(myts,main="")
Pacf(myts,main="")

seasonplot(myts,ylab="Sales Revenue", xlab="Month", 
           main="Monthly Sales Revenue",
           year.labels=TRUE, year.labels.left=TRUE, col=1:20, pch=19)

salestimeseriescomponents <- decompose(myts)
plot(salestimeseriescomponents)

##########Training
arimatraining <-arima(myts,order = c(3,1,1), seasonal=c(0,1,1,12))
fit_data_ar <- forecast(arimatraining,h = 12 )


#checking the accuracy of the model by MAPE value
accuracy(fit_data_ar)

plot(forecast(arimatraining, h = 12), main = "Forescast of Sales Revenue",
     xlab="Time period", ylab = "Sales Revenue")
#####################################################################

##ARCH TEST
arch.test(arimatraining, order())

###########################################################################

#########cheking the residuals
tsdisplay(residuals(arimatest))

#testing the time series data
testTS <-ts(testData$total_sales, start=c(2015,1), frequency = 12)
arimatest2 <- arima(testTS,order = c(3,1,1))
fit_data_ar2 <- forecast(arimatest2, h = 12)


######testing the test data
######generating 12 periods ahead
plot(forecast(arimatest2, h = 12), main = "Forescast of Sales Revenue",
     xlab="Time period", ylab = "Sales Revenue")

###to create ACF/PACF graphic
tsdisplay(residuals(arimatest2))

accuracy(fit_data_ar2)
#ARCH.TEST
arch.test(arimatest2)
