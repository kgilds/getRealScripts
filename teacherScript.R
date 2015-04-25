###########################Set working Directory##############################################

setwd("C:/Users/kevin/Dropbox/GetReal/Data/Raw Data/December2014/teacher")

#######################Library################################3
library(dplyr)

########################### Read Files######################################################
teacher <- read.csv("teacherSurvey0424.csv", skip=1)


######################## Change Column Names###############################################

colnames (teacher)[6] <- "council"
colnames (teacher)[7] <- "girlCode"
colnames (teacher)[8] <- "school"
colnames (teacher)[9] <- "Time"
colnames (teacher)[10] <- "MotivatedToGraduateHighSchool"
colnames (teacher)[11] <- "hasSelfConfidence"
colnames (teacher)[12] <- "goodAttitudeAboutSchool"
colnames (teacher)[13] <- "isInterestedInReading"
colnames (teacher)[14] <- "postivelyParticpatesInClass"
colnames (teacher)[15] <- "completesHomeworkGivenToHer"
colnames (teacher)[16] <- "hasDevelopedPostiveRelationshipsWithHerClassmates"
colnames (teacher)[17] <- "helpedHerIncreasedHerSelfConfidence"
colnames (teacher)[18] <- "helpedHerAchieveSucessInSchool"
colnames (teacher)[19] <- "helpedHerDevelopPostiveRelationship"
colnames (teacher)[20] <- "benefitsFromParticipating"
colnames (teacher)[21] <- "whatCouldBeDoneToImproveTheProgram"


teacher$girlCode <- as.character(teacher$girlCode)

teacher$girlCode <- toupper(teacher$girlCode)



#########################Subset######################################

teacherfin <- subset (teacher, Finished == 1)
dim(teacherfin)


############################Dupes###########################33

teacherUnique <- teacherfin [!(duplicated(teacherfin$girlCode) | duplicated(teacherfin$girlCode, fromLast=TRUE)),]



parentUnique <- parfin [!(duplicated(parfin$girlCode) | duplicated(parfin$girlCode, fromLast=TRUE)), ]






parPreUni <- parPre[!duplicated(parPre$girlCode), ]

datRequestT <- select(teacherfin, StartDate, EndDate, girlCode, council, school)


write.csv(datRequestT, "teacher.csv", row.names=FALSE)


dupPre <-duplicated(teacherfin$girlCode, teacherfin$girlScoutCouncil)
table(dupPre)  #12/18/2014 duplicates 11. 

head(teacherfin)

#####################Council Subset#############################3

#1 
teachCitrus <- filter(teacherfin,girlScoutCouncil == "Citrus Council")
dim(teachCitrus)

write.csv(teachCitrus, "teachCitrus.csv", row.names=FALSE)

head(teachCitrus)

names(teachCitrus)

dupCiturs <- duplicated(teachCitrus$girlCode)

table(dupCiturs)

#2
teachGateway <- filter (teacherfin, girlScoutCouncil == "Gateway Council")
dim(teachGateway)


write.csv(teachGateway, "teacherGateway110914.csv", row.names=FALSE)

teachGateway
dupGateway <-duplicated(teachGateway$girlCode)
table(dupGateway)

#3
teachPanhandle <- filter (teacherfin, girlScoutCouncil == "Panhandle Council")
dim(teachPanhandle)

#4
teachSoutheast <- filter (teacherfin, girlScoutCouncil == "Southeast Council")
dim(teachSoutheast)

dupsoutheast <-duplicated(teachSoutheast$girlCode)

table(dupsoutheast)

#5
teacherTropical <- filter (teacherfin, girlScoutCouncil == "Tropical Council")
dim(teacherTropical)

dupTropical <-duplicated(teacherTropical$girlcode)

table(dupTropical)

#6
teacherGswcf <- filter (teacherfin, girlScoutCouncil == "West Central Council")
dim(teacherGswcf)

write.csv(teacherGswcf, "teachergswcf110914.csv", row.names=FALSE)

dupgswcf <-duplicated(teacherGswcf$girlCode)

table(dupgswcf)



#######################Subset Pre###################################

teacherPre <- subset(teacherfin, Time == "Pre")
dim(teacherPre)






saveRDS(teacherUni, "preTeacher0103.rds")




##################################Council Summary################3

summary(teacherPre$girlScoutCouncil)


write.csv(teacherDup, "teacherDup.csv", row.names=FALSE)

teacherPreUni <- teacherPre[!duplicated(teacherPre$girlCode), ]
dim(teacherPreUni)


#########################Pre Analysis#############################

teacherPre <-tbl_df(teacherPreUni)

teacherPre_1 <- select(teacherPre, MotivatedToGraduateHighSchool:helpedHerDevelopPostiveRelationship )

summary(teacherPre_1)


#######################Subset Post###################################

teacherPost <- subset(teacherfin, Time == "Post")
dim(teacherPost)

teacherPostUni <- teacherPost[!duplicated(teacherPre$girlCode),]
dim(teacherPostUni)

#####################Post Analysis###################################

teacherPost_1 <- tbl_df(teacherPostUni)
dim(teacherPost_1)

teacherPost_2 <- select(teacherPost_1, MotivatedToGraduateHighSchool: helpedHerDevelopPostiveRelationship )
summary(teacherPost_2)

##########################Bind#######################################3

prePostTeacher <- rbind(teacherPostUni, teacherPreUni)
dim(prePostTeacher)

##########################Merge##################################

mergedTeacherPrePost <- merge(teacherPostUni, teacherPreUni, by="girlCode")

TeacherPrePost<-summary(mergedTeacherPrePost)

write.csv(TeacherPrePost, "TeacherPrePost.csv", row.names=FALSE)
