########################Set Working Directories##################
setwd("C:/Users/kevin/Dropbox/GetReal/Data/April 2015")


#########################Libraries############################################

library(dplyr)


###########################Read Data#############################################
rawdata <- read.csv("girlSurvey03.29.csv", skip=1)

########################### Change Column Name #################################

colnames (rawdata)[6] <- "hr.sum"
colnames (rawdata)[7] <- "hr.avg"
colnames (rawdata)[8] <- "hr.stddev"
colnames (rawdata)[9] <- "hr.disqualify.sum"
colnames (rawdata)[10] <- "ae.sum"
colnames (rawdata)[11] <- "ae.avg"
colnames (rawdata)[12] <- "ae.stddev"
colnames (rawdata)[13] <- "am.sum"
colnames (rawdata)[14] <- "am.avg"
colnames (rawdata)[15] <- "am.stddev"
colnames (rawdata)[16] <- "am.disqualify.sum"
colnames (rawdata)[17] <- "ae.disqualify.sum"
colnames (rawdata)[18] <- "council"
colnames (rawdata)[19] <- "girlCode"
colnames (rawdata)[20] <- "school"
colnames (rawdata)[21] <- "grade"
colnames (rawdata)[22] <- "Time"
colnames (rawdata)[23] <- "inProgramLastYear"
colnames (rawdata)[24] <- "iamMotivatedToGraduateHighSchool"
colnames (rawdata)[25] <- "iReadBooksforFun"
colnames (rawdata)[26] <- "ireallyLikeWhoIam..."
colnames (rawdata)[27] <- "..ImproveMySkilsThisYear"
colnames (rawdata)[28] <- "...UnderstandMyClassWork"
colnames (rawdata)[29] <-  "learningatSchoolIsImportantToMe"
colnames (rawdata)[30] <- "oneOfMyGoalsIstoLearn..."
colnames (rawdata)[31] <- "...WillHelpMeLaterInLife"
colnames (rawdata)[32] <- "ifIHaveASeriousProblem..."
colnames (rawdata)[33] <- "inAnyRelationshipOrNotIMakeItClear"
colnames (rawdata)[34] <- "iTalkWithMyTeachersBeforeOrAfter..."
colnames (rawdata)[35] <- "iHandinMyAssignmentsOnTime"
colnames (rawdata)[36] <- "iFinishMyHomeworkEvenIfItisBoring"
colnames (rawdata)[37] <- "ifICantUnderstandMySchoolatFirstI..."
colnames (rawdata)[38] <- "iLetPeopleKnowIfTheyHurtMyFeelings"
colnames (rawdata)[39] <- "iLetMyFriendsKnowWhenIThinkTheyAreGoodAtSomething"
colnames (rawdata)[40] <- "ILearnedFromTheBooksWeReadThisYear"
colnames (rawdata)[41] <- "myReadingSkillsImprovedThisYear"
colnames (rawdata)[42] <- "EstablishedAPostiveRelationship..."
colnames (rawdata)[43] <- "...HelpedMeRecognizeThingsIDoWell"
colnames (rawdata)[44] <- "whatDidYouLearnThisYear. "



######################## Change Girl Code #################################

rawdata$girlCode <- as.character(rawdata$girlCode)

rawdata$girlCode <- toupper(rawdata$girlCode)

str(rawdata$girlCode)


####################Subset Finished#####################################
# Finished 

fin <- subset (rawdata, Finished  == 1)





############################## Subset Pre ############################3

pre <- subset (fin, Time == "Pre")



##############################Subset Post###############################
post <-subset (fin, Time == "Post")



##############################Subset Duplicate Values##################

preDupes <-duplicated(pre$girlCode) | duplicated(pre$girlCode, fromLast=TRUE)

preDupes <-pre[preDupes, ]





############################# Removed Duplicates###############################

preUnique<- pre [!(duplicated(pre$girlCode) | duplicated(pre$girlCode, fromLast = TRUE)), ]



#############################Subset Pre Unique Values#####################



saveRDS(preUnique, file="preGirl0329.rds")






save

councilsum <-summary(preUnique$council)

councilsum





councilsum <-as.data.frame(councilsum)

class(councilsum)

dim(councilsum)

names(councilsum)

councilsumtable <-xtable(councilsum, floating=TRUE)

print(councilsumtable)


#############################Subset Questions#############################




