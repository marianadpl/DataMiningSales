library('ggplot2')
library('forecast')

file <- 'C:/Users/Ronaldo Martins/Documents/University/Data_Web_Mining/CA_2_Data/sales_train_v2.csv'
SalesPred <- read.csv(file, sep=",",header = T)
head(SalesPred,10)
##############

#removing the minus values from dataset
df <- SalesPred[which(SalesPred$item_cnt_day !=-1),]
head(df,20)
#converting field date to type date
df$date =as.Date(df$date, "%d.%m.%Y")

#creating a column Total that receives (item_price * item_cnt_day)
df['Sum_Item'] <-df$item_price*df$item_cnt_day

cor(df$date_block_num,df$Sum_Item)

frame2<-data.frame(df$date, df$Sum_Item)

correlation <-lm(df$date_block_num ~ df$Sum_Item)
correlation
myts <-ts(frame2, start=0, end=33, frequency=12) 

shapiro.test(frame$item_cnt_day)

boxplot(frame$item_cnt_day)

#Criar variavel que multiplica numero de itens vendidos por preço
myts
summary(correlation)
plot(myts)
length(SalesPred$date)

####ARIMA
##pegando o item a ser forecasted 
newTotal <- diff(SalesPred$Sum_Item, 4)
fit_data <- arima(newTotal, order = c(1,0,0))

#forecasting
fit_data_ar <- forecast(fit_data, h = 10)
fit_data_ar
plot(forecast(fit_data_ar, h = 10), include = 10)
summary(fit_data_ar)









