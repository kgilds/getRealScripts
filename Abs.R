library(sqldf)
library(reshape2)
library(dplyr)
getRealdb<- dbConnect(SQLite(), dbname="tempGetReal.sqlite")

### Read the data
Q1Uabs <- readRDS("Q1Uabs.rds")

Q2Uabs <- readRDS("Q2Uabs.rds")


Q1Eabs <-readRDS("Q1excused.rds")
Q2Eabs <-readRDS("Q2excused.rds")



#####Excused Abs. 
excused<-dbReadTable(getRealdb, "excused")

####Cleanup
excusedA <-select(excused,council, girlCode, excusedAbs, excusedAbs.1 )

####Change colnames
colnames (excusedA) [3] <- "Q1"
colnames (excusedA) [4] <- "Q2"

####Difference
excusedDiff <-excusedA$Q2-excusedA$Q1

####Bindit

excusedFinal <-rbind



################################Unexcused Abs###################################3



####Merge the data Unexcused
q1q2Uabs <-merge(Q2Uabs, Q1Uabs, by="girlCode", all=FALSE)

###Clean up Unexcused
q1q2UabsA <- select(q1q2Uabs, girlCode, council.x,unexusedAbs.x, unexusedAbs.y)


differenceUbs <- q1q2UabsA$unexusedAbs.y-q1q2UabsA$unexusedAbs.x

table(differenceUbs)


dbWriteTable(conn = getRealdb, name = "Q2Eabs", value= Q2Eabs, row.names=FALSE, overwrite=TRUE)
dbWriteTable(conn = getRealdb, name = "Q1Eabs", value= Q1Eabs, row.names=FALSE, overwrite=TRUE)


dbWriteTable(conn = getRealdb, name = "Q2Uabs", value= Q2Uabs, row.names=FALSE, overwrite=TRUE)

dbWriteTable(conn= getRealdb, name = "Q1Uabes", value = Q1Uabs,row.names=FALSE, overwrite=TRUE)