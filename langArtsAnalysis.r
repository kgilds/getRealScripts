library(sqldf)
library(reshape2)
library(dplyr)
getRealdb<- dbConnect(SQLite(), dbname="temp2getRealDatabase")

####Read the data
Q2Lang <-readRDS("Q2lang.rds")
Q1Lang <-readRDS("Q1lang.rds")

###Rid NAs
Q2Lang <-na.omit(Q2Lang)
Q1Lang <-na.omit(Q1Lang)

###Merge datasets
langQ1Q2 <-merge(Q2Lang, Q1Lang, by="girlCode", all=FALSE)




####Select the Columns from Q1 and Q2 to clean up
langQ1Q2A <-select(langQ1Q2, girlCode, council.x, variable.x, value.x, variable.y, value.y)




####Change the factor Back

langQ1Q2A$value.x <-as.numeric(langQ1Q2A$value.x)
langQ1Q2A$value.y <-as.numeric(langQ1Q2A$value.y)



gradedifferenceLang<- langQ1Q2A$value.y-langQ1Q2A$value.x

data.frame(gradedifferenceLang) 


langArtsFinal <-cbind(langQ1Q2A, gradedifferenceLang)



