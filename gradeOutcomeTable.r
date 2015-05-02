library(sqldf)
library(reshape2)
library(dplyr)
setwd("C:/Users/kevin/Dropbox/GetReal/Data/April 2015")
getRealdb<- dbConnect(SQLite(), dbname="getRealApril.sqlite")

dbListTables(getRealdb)

###########################################Reading###################################################

###Read the data from database#######3
reading_A <-dbReadTable(getRealdb, "readingFinal")


#######Table with Difference Breakdown###########

diff_tab1 <-with(reading_A, table(diff))




######Find those that maintained lower than C Grade
belowC <- with(reading_A, table(Q1grade < 3))


#######Raised from failing to passing###############
failPass_df <-with(reading_A, table( Q1grade <3 & Q2grade >=3))


###############FailToFail#################################
failToFail <-with(reading_A,table(Q1grade <3 & Q2grade <3))


#################### C Plus to Fail

CDrop <- with(reading_A,table(Q1grade >=3 & Q2grade <3))


####################C and higher#################3

CPlus <-with(reading_A, table(Q1grade >=3 & Q2grade >=3))


#######################Lang Arts Final#######################33

langArts_A <- dbReadTable(getRealdb, "langArtsFinal")

lang_Cs <-filter (langArts_A, Q1langgrade >=3 & diffLang >=0)

csLang <-with(langArts_A, table(Q1langgrade >=3 & diffLang >=0))







