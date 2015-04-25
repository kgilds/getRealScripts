### Set Working Directory
setwd("C:/Users/kevin/Dropbox/GetReal/Data/April 2015")

#### Load the Libraries
library(dplyr)
library(reshape2)

####
gradesQ2 <-read.csv("Q2grades0424.csv", skip=1)

### Demo Variables
colnames (gradesQ2) [7] <- "council"
colnames (gradesQ2) [8] <- "girlCode"
colnames (gradesQ2) [9] <- "schoolName"
colnames (gradesQ2) [10] <- "dateEnrolled"


#### Behavioral Variables
colnames (gradesQ2) [11] <- "unexusedAbs"
colnames (gradesQ2) [12] <- "excusedAbs"
colnames (gradesQ2) [13] <- "behaviorRef"
colnames (gradesQ2) [14] <- "inSchoolSusp"
colnames (gradesQ2) [15] <- "outofSchoolSusp"
colnames (gradesQ2) [16] <- "expelled"

#########Reading Grades
colnames (gradesQ2) [18] <- "mjIntensRead_Quarter"
colnames (gradesQ2) [19] <- "mjIntensRead_Semester"

colnames (gradesQ2) [20] <- "mjIntenseReadCareerPlaning_Quarter"
colnames (gradesQ2) [21] <- "mjIntenseReadCareerPlaning_Semester"


colnames (gradesQ2) [22] <- "mjRead1_Quarter"
colnames (gradesQ2) [23] <- "mjRead1_Semester"

colnames (gradesQ2) [24] <- "mjRead1Adv_Quarter"
colnames (gradesQ2) [25] <- "mjRead1Adv_Semester"


colnames (gradesQ2) [26] <- "mjRead2_Quarter"
colnames (gradesQ2) [27] <- "mjRead2_Semester"


colnames (gradesQ2) [28] <- "mjRead2Adv_Quarter"
colnames (gradesQ2) [29] <- "mjRead2Adv_Semester"

colnames (gradesQ2) [30] <- "mjRead3_Quarter"
colnames (gradesQ2) [31] <- "mjRead3_Semester"

colnames (gradesQ2) [32] <- "mjRead3Adv_Quarter"
colnames (gradesQ2) [33] <- "mjRead3Adv_Semester"


colnames (gradesQ2) [34] <- "mjDelaESOLRead_Quarter"
colnames (gradesQ2) [35] <- "mjDelaESOLRead_Semester"


colnames (gradesQ2) [36] <- "readFree1_Quarter"
colnames (gradesQ2) [37] <- "readFree2_Semester"
colnames (gradesQ2) [38] <- "letterGrade" 


### Lang Arts Courses

colnames (gradesQ2) [39] <- "mjLangArts1ESOL_Quarter"
colnames (gradesQ2) [40] <- "mjLangArts1ESOL_Semester"

colnames (gradesQ2) [41] <- "mjLangArts2ESOL_Quarter"
colnames (gradesQ2) [42] <- "mjLangArts2ESOL_Semester"

colnames (gradesQ2) [43] <- "mjLangArts3ESOL_Quarter"
colnames (gradesQ2) [44] <- "mjLangArts3ESOL_Semester"

colnames (gradesQ2) [45] <- "mjDevelpmentalESOL_Quarter"
colnames (gradesQ2) [46] <- "mjDevelpmentalESOL_Semester"

colnames (gradesQ2) [47] <- "mjLangArts1_Quarter"
colnames (gradesQ2) [48] <-  "mjLangArts1_Semester"


colnames (gradesQ2) [49] <-"mjlangsArts1Adv_Quarter"
colnames (gradesQ2) [50] <-"mjlangsArts1Adv_Semester"


colnames (gradesQ2) [51] <-"mjLangArts2_Quarter"
colnames (gradesQ2) [52] <-"mjLangArts2_Semester"


colnames (gradesQ2) [53] <- "mjLangArts2Adv_Quarter" 
colnames (gradesQ2) [54] <- "mjLangArts2Adv_Semester" 


colnames (gradesQ2) [55] <- "mjLangArts3_Quarter"
colnames (gradesQ2) [56] <- "mjLangArts3_Semester"


colnames (gradesQ2) [57] <- "mjLangArts3Adv_Quarter"
colnames (gradesQ2) [58] <- "mjLangArts3Adv_Semester"

colnames (gradesQ2) [59] <- "mjEng2Cambsec2_Quarter"
colnames (gradesQ2) [60] <- "mjEng2Cambsec2_Semester"

colnames (gradesQ2) [61] <- "mjIBLangArts1_Quarter"
colnames (gradesQ2) [62] <- "mjIBLangArts1_Semester"

colnames (gradesQ2) [63] <- "mjEng2CamSec1_Quarter"
colnames (gradesQ2) [64] <- "mjEng2CamSec1_Semester"

colnames (gradesQ2) [65] <- "mjIBLangArts3_Quarter"
colnames (gradesQ2) [66] <- "mjIBLangArts3_Semester"

colnames (gradesQ2) [67] <- "mjIBLangArts2_Quarter"
colnames (gradesQ2) [68] <- "mjIBLangArts2_Semester"


colnames (gradesQ2) [69] <- "mjEng3Cambsec3_Quarter"
colnames (gradesQ2) [70] <- "mjEng3Cambsec3_Semester"


colnames (gradesQ2) [71] <- "mjIntenseLangArts_Quarter"
colnames (gradesQ2) [72] <- "mjIntenseLangArts_Semester"

colnames (gradesQ2) [73] <- "freeLang1_Quarter"
colnames (gradesQ2) [74] <- "freeLang2_Semester"
colnames (gradesQ2) [75] <- "grade"


#######################Fix Girl code###################################


gradesQ2$girlCode <- toupper(gradesQ2$girlCode)

gradesQ2$council <- as.character(gradesQ2$council)

gradesQ2$girlCode <- as.character(gradesQ2$girlCode)


################Finished Data Entry####################################

gradesQ2 <- filter(gradesQ2, Finished == 1)


##############################Subset Duplicate Values##################

q2Dupes <-duplicated(gradesQ2$girlCode) | duplicated(gradesQ2$girlCode, fromLast=TRUE)

q2Dupes <-gradesQ2[q2Dupes, ]




################### Rid Duplicates#########################################


gradesUniqueQ2 <- gradesQ2 [!(duplicated(gradesQ2$girlCode) | duplicated(gradesQ2$girlCode, fromLast = TRUE)), ]



##################Reading###########################################

q2Reading <- gradesUniqueQ2[,c( 7,8, 18, 19, 20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35)]


#######Melt the data frame. 
mq2Reading <- melt(q2Reading, id.vars=c("girlCode", "council"))

####Change value to factor. 
mq2Reading$value <- as.factor(mq2Reading$value)


###change Labels on the levels
levels(mq2Reading$value) <- c("F","D", "C", "B", "A")


#############Free Read############################

q2freeRead <- gradesUniqueQ2 [,c(7,8,36,37,38)]


grep("read", ignore.case=TRUE, q2freeRead$readFree1_Quarter, value=TRUE)




q2freeRead3 <- q2freeRead[grep("read", ignore.case=TRUE,q2freeRead$readFree2_Semester),]

colnames (q2freeRead3) [4] <-"variable"
colnames (q2freeRead3) [3] <-"value"



####Change value to factor. 
q2freeRead3$value <- as.factor(q2freeRead3$value)



###change Labels on the levels
levels(q2freeRead3$value) <- c("F","D", "C", "B", "A")

###Bind the data frames together. 
mq2Reading2 <-rbind(mq2Reading, q2freeRead3)




###Subset Lang Arts Courses

q2Lang <- gradesUniqueQ2 [, c(7,8,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72)]

##### Melt the data frame
mq2Lang <-melt(q2Lang, id.vars=c("girlCode", "council"))

######Convert to factor
mq2Lang$value <-as.factor(mq2Lang$value)

#######Label the levels
levels(mq2Lang$value) <- c("F", "D", "C", "B", "A")


### Free Rangers Lang Arts

####Find the Lang Arts Courses
freelangQ2 <- gradesQ2[, c(7,8,73,75)]


####Clean it up
freelangQ2<-na.omit(freelangQ2)


###Change Column names##################
colnames (freelangQ2) [73] <- "variable"
colnames (freelangQ2) [74] <- "value"


mergedQ2Lang <- rbind(mq2Lang, freelangQ2)

###############Absences##############

####Unexcused Absences

q2Uabs <- gradesUniqueQ2[, c(7,8, 11)]

q2Uabs$unexusedAbs <-as.numeric(q2Uabs$unexusedAbs)


#####Excused Absences

q2Eabs <-gradesUniqueQ2[, c(7,8,12)]

q2Eabs$excusedAbs <-as.numeric(q2Eabs$excusedAbs)


####################In School Suspensions##############

q2Is <- gradesUniqueQ2[, c(7,8,14)]


q2Is$inSchoolSusp <- as.numeric(q2Is$inSchoolSusp)




##################Out of School Suspensions#############3

q2Os <- gradesUniqueQ2[, c(7,8,15)]

q2Os$outofSchoolSusp <- as.numeric(q2Os$outofSchoolSusp)



#######Behavioral Referrals

q2Bev <- gradesUniqueQ2[, c(7,8,13)]



q2Bev$behaviorRef <-as.numeric(q2Bev$behaviorRef)



#################Expelled###########################

q2Exp <-gradesUnique[, c(7,8,16)]






