library(sqldf)
library(reshape2)
library(dplyr)
getRealdb<- dbConnect(SQLite(), dbname="tempGetReal.sqlite")


####Reading Grades
saveRDS(mq2Reading2, file="Q2.rds")
Q2Reading <-readRDS("Q2.rds")
Q2Reading <-na.omit(Q2Reading)
Q2Reading$value<-as.numeric(Q2Reading$value)


dbWriteTable(conn = getRealdb, name = "Q2Reading", value= Q2Reading, row.names=FALSE, overwrite=TRUE)


saveRDS(mq1Reading2, file="Q1.rds")
Q1Reading <-readRDS("Q1.rds")
Q1Reading <-na.omit(Q1Reading)
Q1Reading$readingGrade <-as.numeric(Q1Reading$readingGrade)
dbWriteTable(conn = getRealdb, name = "Q1Reading", value= Q1Reading, row.names=FALSE, overwrite=TRUE)




#####Lang Arts
saveRDS(mq2Lang, file="Q2lang.rds")

Q2Lang<-readRDS("Q2lang.rds")
Q2Lang<-na.omit(Q2Lang)
Q2Lang$value <-as.numeric(Q2Lang$value)
dbWriteTable(conn = getRealdb, name = "Q2Lang", value= Q2Lang, row.names=FALSE, overwrite=TRUE)


saveRDS(mq1Lang,file="Q1lang.rds")
Q1Lang <-readRDS("Q1lang.rds")
Q1Lang <-na.omit(Q1Lang)
Q1Lang$langArtsGrade <- as.numeric(Q1Lang$langArtsGrade)

dbWriteTable(conn = getRealdb, name = "Q1Lang", value= Q1Lang, row.names=FALSE, overwrite=TRUE)



####Unexcused Abs
saveRDS(q2Uabs, file="Q2Uabs.rds")

saveRDS(q1Uabs, file="Q1Uabs.rds")

####Excused Abs
saveRDS(q2Eabs, file="Q2excused.rds")

saveRDS(q1Exabs, file="Q1excused.rds")

###In School Suspensions
saveRDS(q2Is, file="q2Inschool.rds")
q2InSchool <-readRDS("q2Inschool.rds")
dbWriteTable(conn = getRealdb, name = "q2InSchool", value= q2InSchool, row.names=FALSE, overwrite=TRUE)


saveRDS(q1Is, file="q1Inschool.rds")
q1InSchool <-readRDS("q1Inschool.rds")
dbWriteTable(conn = getRealdb, name = "q1InSchool", value= q1InSchool, row.names=FALSE, overwrite=TRUE)


####Out of School Suspensions
saveRDS(q2Os, file="q2Outschool.rds")
q2OutSchool <-readRDS("q2Outschool.rds")
dbWriteTable(conn = getRealdb, name = "q2OutSchool", value= q2OutSchool, row.names=FALSE, overwrite=TRUE)


saveRDS(q1Os, file="q1Outschool.rds")
q1OutSchool <-readRDS("q1Outschool.rds")
dbWriteTable(conn = getRealdb, name = "q1OutSchool", value= q1OutSchool, row.names=FALSE, overwrite=TRUE)


####Behavorial Referrals

saveRDS(q2Bev, file="q2bevRef.rds")
q2Bev <-readRDS("q2bevRef.rds")
dbWriteTable(conn = getRealdb, name = "q2Bev", value= q2Bev, row.names=FALSE, overwrite=TRUE)


saveRDS(q1Bev, file="q1bevRef.rds")
q1Bev <-readRDS("q1bevRef.rds")
dbWriteTable(conn = getRealdb, name = "q1Bev", value= q1Bev, row.names=FALSE, overwrite=TRUE)


