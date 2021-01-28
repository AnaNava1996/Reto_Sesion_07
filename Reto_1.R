install.packages("DBI")
install.packages("RMySQL")

library(DBI)
library(RMySQL)


MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

dbListTables(MyDataBase)
dbListFields(MyDataBase, 'CountryLanguage')
DataDB <- dbGetQuery(MyDataBase, "SELECT CountryCode, Percentage FROM CountryLanguage WHERE Language LIKE 'spanish'")

class(DataDB)
dim(DataDB)
head(DataDB)



