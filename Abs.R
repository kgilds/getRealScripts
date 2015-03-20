library(sqldf)
library(reshape2)
library(dplyr)
getRealdb<- dbConnect(SQLite(), dbname="tempGetReal.sqlite")

### Read the data
Q1Uabs <- readRDS("Q1Uabs.rds")

Q2Uabs <- readRDS("Q2Uabs.rds")

####Merge the data
q1q2Uabs <-merge(Q2Uabs, Q1Uabs, by="girlCode", all=FALSE)


q1q2UabsA <- select(q1q2Uabs, girlCode, council.x,unexusedAbs.x, unexusedAbs.y)




differenceUbs <- q1q2UabsA$unexusedAbs.y-q1q2UabsA$unexusedAbs.x

table(differenceUbs)




dbWriteTable(conn = getRealdb, name = "Q2Uabs", value= Q2Uabs, row.names=FALSE, overwrite=TRUE)

dbWriteTable(conn= getRealdb, name = "Q1Uabes", value = Q1Uabs,row.names=FALSE, overwrite=TRUE)