file <- 'C:/Users/Ronaldo Martins/Documents/University/Data_Web_Mining/CA_2_Data/sales_train_v2.csv'
SalesPred <- read.csv(file, sep=",",header = T)
head(SalesPred)
##############

#Merging Dataset

#Sales <- read.csv( "sales_train_v2.csv", sep=",", header=T)

#Item <- read.csv( "items.csv", sep=",", header=T)

#ItemCat <- read.csv( "item_categories.csv", sep=",", header=T)

#Shops <- read.csv( "shops.csv", sep=",", header=T)

#SalesPred = merge(Sales, Item)
#SalesPred = merge(SalesPred, ItemCat)
#SalesPred = merge(SalesPred, Shops)
#SalesPred

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

cor(SalesPred$date_block_num, SalesPred$item_cnt_day)

Model <- lm(date_block_num ~ item_cnt_day, data=SalesPred)
Model

shapiro.test(SalesPred$item_cnt_day)

boxplot(SalesPred$item_cnt_day)

#Criar variavel que multiplica numero de itens vendidos por preço
