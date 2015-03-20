library(sqldf)
library(reshape2)
library(dplyr)
setwd("C:/Users/kevin/Dropbox/GetReal/Reports/sqlite")
getRealdb<- dbConnect(SQLite(), dbname="temp2getRealDatabase")


Q1 <- readRDS("Q1.rds")

Q2 <- readRDS("Q2.rds")

###Rids NAs
Q2new <- na.omit(Q2)
Q1new <-na.omit(Q1)



####Merge Q1 and Q2
q1q2 <-merge(Q1new, Q2new, by="girlCode", all=FALSE)


### Council Data
with(q1q2, table(council.x, council.y))


####Select the Columns from Q1 and Q2 to clean up
q1q2A <-select(q1q2, girlCode, council.x, variable.x, value.x, variable.y, value.y)


#Change the Grade factors to numbers
q1q2A$value.x <-as.numeric(q1q2A$value.x)
q1q2A$value.y <-as.numeric(q1q2A$value.y)

#####difference between grades##############################3
gradedifference<- q1q2A$value.y-q1q2A$value.x

data.frame(gradedifference) 



readingFinal <-cbind(q1q2A, gradedifference)