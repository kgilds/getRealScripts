########################Set Working Directories##################
setwd("C:/Users/kevin/Dropbox/GetReal/Data/February2015")


#########################Libraries############################################

library(dplyr)


###########################Read Data#############################################
rawdata <- read.csv("girlSurvey022715.csv", skip=1)
dim(rawdata)


########################### Change Column Name #################################

colnames (rawdata)[6] <- "hr.sum"
colnames (rawdata)[7] <- "hr.avg"
colnames (rawdata)[8] <- "hr.stddev"
colnames (rawdata)[9] <- "hr.disqualify.sum"
colnames (rawdata)[12] <- "ae.sum"
colnames (rawdata)[13] <- "ae.avg"
colnames (rawdata)[14] <- "ae.stddev"
colnames (rawdata)[15] <- "am.sum"
colnames (rawdata)[16] <- "am.avg"
colnames (rawdata)[17] <- "am.stddev"
colnames (rawdata)[18] <- "am.disqualify.sum"
colnames (rawdata)[21] <- "ae.disqualify.sum"
colnames (rawdata)[26] <- "council"
colnames (rawdata)[27] <- "girlCode"
colnames (rawdata)[28] <- "school"
colnames (rawdata)[30] <- "Time"
colnames (rawdata)[31] <- "inProgramLastYear"
colnames (rawdata)[32] <- "iamMotivatedToGraduateHighSchool"
colnames (rawdata)[33] <- "iReadBooksforFun"
colnames (rawdata)[34] <- "ireallyLikeWhoIam..."
colnames (rawdata)[35] <- "..ImproveMySkilsThisYear"
colnames (rawdata)[36] <- "...UnderstandMyClassWork"
colnames (rawdata)[37] <-  "learningatSchoolIsImportantToMe"
colnames (rawdata)[38] <- "oneOfMyGoalsIstoLearn..."
colnames (rawdata)[39] <- "...WillHelpMeLaterInLife"
colnames (rawdata)[40] <- "ifIHaveASeriousProblem..."
colnames (rawdata)[41] <- "inAnyRelationshipOrNotIMakeItClear"
colnames (rawdata)[42] <- "iTalkWithMyTeachersBeforeOrAfter..."
colnames (rawdata)[43] <- "iHandinMyAssignmentsOnTime"
colnames (rawdata)[44] <- "iFinishMyHomeworkEvenIfItisBoring"
colnames (rawdata)[45] <- "ifICantUnderstandMySchoolatFirstI..."
colnames (rawdata)[46] <- "iLetPeopleKnowIfTheyHurtMyFeelings"
colnames (rawdata)[47] <- "iLetMyFriendsKnowWhenIThinkTheyAreGoodAtSomething"
colnames (rawdata)[48] <- "ILearnedFromTheBooksWeReadThisYear"
colnames (rawdata) [49] <- "myReadingSkillsImprovedThisYear"
colnames (rawdata) [50] <- "EstablishedAPostiveRelationship..."
colnames (rawdata) [51] <- "...HelpedMeRecognizeThingsIDoWell"
colnames (rawdata) [52] <- "whatDidYouLearnThisYear. "



######################## Change Girl Code #################################

rawdata$girlCode <- as.character(rawdata$girlCode)

rawdata$girlCode <- toupper(rawdata$girlCode)

str(rawdata$girlCode)


####################Subset Finished#####################################
# Finished 

fin <- subset (rawdata, Finished  == 1)
dim(fin)


head(fin, n=1)

names(fin)




############################## Subset Pre ############################3

pre <- subset (fin, Time == "Pre")

dim(pre)

##############################Subset Post###############################
post <-subset (fin, Time == "Post")
dim(pre)



##############################Subset Duplicate Values##################

preDupes <-duplicated(pre$girlCode) | duplicated(pre$girlCode, fromLast=TRUE)

preDupes <-pre[preDupes, ]

dim(preDupes)







############################# Removed Duplicates###############################

preUnique<- pre [!(duplicated(pre$girlCode) | duplicated(pre$girlCode, fromLast = TRUE)), ]


dim(preUnique)

#############################Subset Pre Unique Values#####################



saveRDS(preUnique, file="preGirl0103.rds")

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




