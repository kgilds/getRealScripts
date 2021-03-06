library(sqldf)
library(reshape2)
library(dplyr)
setwd("C:/Users/kevin/Dropbox/GetReal/Data/April 2015")
getRealdb<- dbConnect(SQLite(), dbname="getRealApril.sqlite")





dbWriteTable(conn = getRealdb, name = "lastYear1", value= lastYear1, row.names=FALSE, overwrite=TRUE)






###########################################Reading###################################################





###Read the data from database#######3
reading_A <-dbReadTable(getRealdb, "readingFinal")

reading_B <-select(reading_A, council, Q1grade, Q2grade, diff)

reading_A$council <-as.factor(reading_A$council)

plot(reading_B$Q1grade, reading_B$Q2grade)

reading_B_tbl <-with(reading_B,table(Q1grade, Q2grade))


str(reading_A)



########################Split the dataframe#################################3

council <-split(reading_A,reading_A$council)

mean
tapply(reading_A$Q2grade, reading_A$council,mean)

apply (state.x77, 2, median)


#######################Aggregate Analysis#############################333


summary(reading_A)

aggregate(Q1grade~council, reading_A, mean)
aggregate(Q2grade~council, reading_A, mean)





#######Table with Difference Breakdown###########

diff_tab1 <-with(reading_A, table(diff))




######Find # of students who started below a C.

belowC_df <-filter(reading_A, Q1grade <3)


belowC_df$council <-as.factor(belowC_df$council)



belowC_tbl <-with(belowC_df, table(council))

plot(belowC_tbl)


belowC <- with(reading_A, table(Q1grade < 3 & Q2grade <3))



#######Raised from failing to passing###############

failToPass_df <-filter(reading_A, Q1grade <3 & Q2grade >=3)

failToPass_council <- with(failToPass_df,table(council,diff))

dotchart(failToPass_council)


failPass_tbl <-with(reading_A, table( Q1grade <3 & Q2grade >=3))

plot(failPass_tbl)


###############FailToFail#################################
failToFail <-with(reading_A,table(Q1grade <3 & Q2grade <3))


#################### C Plus to Fail

CDrop <- with(reading_A,table(Q1grade >=3 & Q2grade <3))


####################C and higher#################3

CPlus.df <-filter(reading_B, Q1grade >=3 & Q2grade >=3)

CPlus.df.tbl <- with(CPlus.df,table(council, diff))

####Graph

dotchart(CPlus.df.tbl, col="blue")


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