###########################Set working Directory##############################################

setwd("C:/Users/kevin/Dropbox/GetReal/Data/Raw Data/July 2015/teacher")

#######################Library################################3
library(dplyr)

########################### Read Files######################################################
teacher <- read.csv("teacherSurvey07052015.csv", skip=1)


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

#####################Subset Pre Survey Values#######################3

preTeacher <-filter(teacherfin, Time == "Pre")



############################Dupes###########################33

preTeacherUnique <- preTeacher [!(duplicated(preTeacher$girlCode) | duplicated(preTeacher$girlCode, fromLast=TRUE)),]


#########################Subset Post Survey Values#################

postTeacherUnique <- filter(teacherfin, Time == "Post")


#########################Find Unique Values Post Survey################
postTeacherUnique <-  postTeacherUnique [!(duplicated(postTeacherUnique$girlCode) | duplicated(postTeacherUnique$girlCode, fromLast=TRUE)),]




#######################Save Pre and Post Survey Data Frames########################3

saveRDS(preTeacherUnique, file="preTeacher.rds")

saveRDS(postTeacherUnique, file="postTeacher.rds")



########################Check for Errors in Girl Code###################33
errorTest <-select(postTeacherUnique, council, girlCode)

errorTest



#########################Subsets council#############################3333
citrusTeacher <- filter(postTeacherUnique, council == "Citrus Council")


######################################Strips the prefix GirlCode on all data points in subset ##########
girlCodeCitrusTeacher<- sub("312", "", citrusTeacher$girlCode)

###################################Places the 312 prefix back on all the data points in subset
fixgirlCodeCitrusTeacher<- sub("", "312", girlCodeCitrusTeacher)


###########################Replaces back in DF######################3
citrusTeacher$girlCode <- fixgirlCodeCitrusTeacher


#############Test the number of rows in original data frame#################3
dim(postTeacherUnique)

###################Wipe out Citrus data points #############################
excludeCitrusTeacher <-filter(postTeacherUnique, council != "Citrus Council") 
#N=169


###################Placed fixed Citrus Girl Codes back in Df################
postTeacher1 <- rbind(citrusTeacher, excludeCitrusTeacher) 
#N172



######################Save Pre and Post Survey Data Frames########################3

saveRDS(preTeacherUnique, file="preTeacher.rds")

saveRDS(postTeacher1, file="postTeacher.rds")














#
