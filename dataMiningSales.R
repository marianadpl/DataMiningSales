file <- 'C:/Users/Ronaldo Martins/Documents/University/Data_Web_Mining/CA_2_Data/sales_train_v2.csv'
DataFrame <- read.csv(file, sep=",",header = T)
head(DataFrame)
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



cor(SalesPred$date_block_num, SalesPred$item_cnt_day)

Model <- lm(date_block_num ~ item_cnt_day, data=SalesPred)
Model

shapiro.test(SalesPred$item_cnt_day)

boxplot(SalesPred$item_cnt_day)

#Criar variavel que multiplica numero de itens vendidos por preço

