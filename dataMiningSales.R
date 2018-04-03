library('ggplot2')
<<<<<<< HEAD
library('forecast')

=======
install.packages("forecast")
library("forecast")

#Para Ronaldo
>>>>>>> 15c23b3629beb5e6b325dae7a150f9252a4845d5
file <- 'C:/Users/Ronaldo Martins/Documents/University/Data_Web_Mining/CA_2_Data/sales_train_v2.csv'
SalesPred <- read.csv(file, sep=",",header = T)
head(SalesPred,10)
##############

<<<<<<< HEAD
#removing the minus values from dataset
df <- SalesPred[which(SalesPred$item_cnt_day !=-1),]
head(df,20)
#converting field date to type date
df$date =as.Date(df$date, "%d.%m.%Y")
=======
#Para Mari
SalesPred <- read.csv("sales_train_v2.csv", sep=".",header = T)
head(SalesPred)


SalesPred <- read.csv("sales_train_v2.csv", sep=";",header = T)

#Merging Dataset

#Sales <- read.csv( "sales_train_v2.csv", sep=",", header=T)

#Item <- read.csv( "items.csv", sep=",", header=T)
>>>>>>> 15c23b3629beb5e6b325dae7a150f9252a4845d5

#creating a column Total that receives (item_price * item_cnt_day)
df['Sum_Item'] <-df$item_price*df$item_cnt_day

cor(df$date_block_num,df$Sum_Item)

<<<<<<< HEAD
frame2<-data.frame(df$date, df$Sum_Item)

correlation <-lm(df$date_block_num ~ df$Sum_Item)
correlation
myts <-ts(frame2, start=0, end=33, frequency=12) 

shapiro.test(frame$item_cnt_day)
=======
#SalesPred = merge(Sales, Item)
#SalesPred = merge(SalesPred, ItemCat)
#SalesPred = merge(SalesPred, Shops)
#SalesPred


#Criando um frame com as 10 primeiras linhas para facilitar a codificacao
#e a visualizacao dos dados
frame <- data.frame(head(SalesPred,10))

frame

#for iterando as colunas e linhas do data.frame
for(r in 1:ncol(frame)){
  for(j in 1:ncol(frame)){
    #criando uma nova coluna "Sum_Item" no data.frame para armazenar o resultado da 
    #multiplicacao do campo item_price * item_cnt_day
    frame["Sum_Item"] <- (frame[5] * frame[6])
  }
}

>>>>>>> 15c23b3629beb5e6b325dae7a150f9252a4845d5

boxplot(frame$item_cnt_day)

<<<<<<< HEAD
#Criar variavel que multiplica numero de itens vendidos por preço
myts
summary(correlation)
plot(myts)
length(SalesPred$date)
=======
for(r in 1:ncol(SalesPred)){
  for(j in 1:ncol(SalesPred)){
    Sum_Item <- (SalesPred[5] * SalesPred[6])
  }
}
>>>>>>> 15c23b3629beb5e6b325dae7a150f9252a4845d5

####ARIMA
##pegando o item a ser forecasted 
newTotal <- diff(SalesPred$Sum_Item, 4)
fit_data <- arima(newTotal, order = c(1,0,0))

#forecasting
fit_data_ar <- forecast(fit_data, h = 10)
fit_data_ar
plot(forecast(fit_data_ar, h = 10), include = 10)
summary(fit_data_ar)




<<<<<<< HEAD
=======
myts
>>>>>>> 15c23b3629beb5e6b325dae7a150f9252a4845d5



<<<<<<< HEAD
=======
fit <- auto.arima(myts)

fit <- ets(myts)


           

=======
for(r in 1:ncol(SalesPred)){
  for(j in 1:ncol(SalesPred)){
    SalesPred["Sum_Item"]<- (SalesPred[5] * SalesPred[6])
  }
}
length(SalesPred$Sum_Item)

cor(SalesPred$date_block_num,SalesPred$Sum_Item)

frame2<-data.frame(SalesPred$date_block_num, SalesPred$Sum_Item)

myts <-ts(frame2, start=0, end=33, frequency=12) 

shapiro.test(frame$item_cnt_day)
>>>>>>> 15c23b3629beb5e6b325dae7a150f9252a4845d5


<<<<<<< HEAD
=======
#Criar variavel que multiplica numero de itens vendidos por preço
myts

plot(myts)


####ARIMA
##pegando o item a ser forecasted 
newTotal <- diff(SalesPred$Sum_Item, 4)
fit_data <- arima(newTotal, order = c(1,0,0))

#forecasting
fit_data_ar <- forecast(fit_data, h = 10)

plot(forecast(fit_data_ar, h = 10), include = 10)
summary(fit_data_ar)


>>>>>>> 15c23b3629beb5e6b325dae7a150f9252a4845d5
