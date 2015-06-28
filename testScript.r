library(sqldf)
library(reshape2)
library(dplyr)
getRealdb<- dbConnect(SQLite(), dbname="getRealJune.sqlite")


#####Reading Grades for Q3###############3

q3.reading <- readRDS("q3Reading1.rds")

dbWriteTable(conn = getRealdb, name = "q3reading", value = q3.reading, row.names = FALSE, overwrite=TRUE)



gateway <- filter(q3.reading, council =="Girl Scouts of the Gateway Council")


gateway$girlCode




 

test1<- sub("313", "", gateway$girlCode)

fixgirlCode<- sub("", "313", test1)

gateway2 <-cbind(gateway, fixgirlCode)






