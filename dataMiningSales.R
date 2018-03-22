file <- 'C:/Users/Ronaldo Martins/Documents/University/Data_Web_Mining/CA_2_Data/sales_train_v2.csv'
DataFrame <- read.csv(file, sep=",",header = T)
head(DataFrame)
##############

cor(SalesPred$date_block_num, SalesPred$item_cnt_day)

Model <- lm(date_block_num ~ item_cnt_day, data=SalesPred)
Model

shapiro.test(SalesPred$item_cnt_day)

boxplot(SalesPred$item_cnt_day)