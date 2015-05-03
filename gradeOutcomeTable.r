library(sqldf)
library(reshape2)
library(dplyr)
setwd("C:/Users/kevin/Dropbox/GetReal/Data/April 2015")
getRealdb<- dbConnect(SQLite(), dbname="getRealApril.sqlite")

dbListTables(getRealdb)

###########################################Reading###################################################

###Read the data from database#######3
reading_A <-dbReadTable(getRealdb, "readingFinal")

reading_B <-select(reading_A, council, Q1grade, Q2grade)

reading_A$council <-as.factor(reading_A$council)

str(reading_A)


#######################Aggregate Analysis#############################333


with(reading_A, tapply(council(Q1grade, Q2grade),mean))

aggregate(Q1grade~council, reading_A, mean)
aggregate(Q2grade~council, reading_A, mean)

with(mtcars, tapply(hp, list(cyl, gear), mean))



#######Table with Difference Breakdown###########

diff_tab1 <-with(reading_A, table(diff))




######Find # of students who started below a C.

belowC_df <-filter(reading_A, Q1grade <3)


belowC_df$council <-as.factor(belowC_df$council)



belowC_tbl <-with(belowC_df, table(council))


belowC <- with(reading_A, table(Q1grade < 3 & Q2grade <3))



#######Raised from failing to passing###############

failToPass_df <-filter(reading_A, Q1grade <3 & Q2grade >=3)

failToPass_council <- with(failToPass_df,table(council))


failPass_tbl <-with(reading_A, table( Q1grade <3 & Q2grade >=3))


###############FailToFail#################################
failToFail <-with(reading_A,table(Q1grade <3 & Q2grade <3))


#################### C Plus to Fail

CDrop <- with(reading_A,table(Q1grade >=3 & Q2grade <3))


####################C and higher#################3

CPlus <-with(reading_A, table(Q1grade >=3 & Q2grade >=3))


#######################Lang Arts Final#######################33

langArts_A <- dbReadTable(getRealdb, "langArtsFinal")


#######################General Differences############33
diff_lang <- with(langArts_A, table(diffLang))


####################Maintain Below C##################3

belowCLang <-with(langArts_A, table(Q1langgrade < 3))


###################Fail to Pass######################

failToPassLang <-with(langArts_A, table(Q1langgrade <3 & Q2langgrade >=3))


####################Fail to Fail#######################

failToFailLang <-with(langArts_A, table(Q1langgrade <3 & Q2langgrade <3))


####################C Plus to fail#####################33

passToFailLang <-with(langArts_A, table(Q1langgrade >=3 & Q2langgrade <3))



###################C Plus to CPluse################3

PassToPassLang <- with(langArts_A, table(Q1langgrade >=3 & Q2langgrade >=3))