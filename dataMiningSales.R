library('ggplot2')
library('forecast')

file <- 'C:/Users/Ronaldo Martins/Documents/University/Data_Web_Mining/CA_2_Data/sales_train_v2.csv'
SalesPred <- read.csv(file, sep=",",header = T)
head(SalesPred)
##############


#Criando um frame com as 10 primeiras linhas para facilitar a codificacao
#e a visualizacao dos dados
frame <- data.frame(head(SalesPred,10))

#for iterando as colunas e linhas do data.frame
for(r in 1:ncol(frame)){
  for(j in 1:ncol(frame)){
    #criando uma nova coluna "Sum_Item" no data.frame para armazenar o resultado da 
    #multiplicacao do campo item_price * item_cnt_day
    frame["Sum_Item"] <- (frame[5] * frame[6])
  }
}

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

boxplot(frame$item_cnt_day)

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









