### Set Working Directory
setwd("C:/Users/kevin/Dropbox/GetReal/Data/July 2015/grades/q2")

#### Load the Libraries
library(dplyr)
library(reshape2)

####
gradesQ2 <-read.csv("q2Grades07112015.csv", skip=1)

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

#####################test

councils <-select(gradesUniqueQ2, council, girlCode)

head(councils, n=50)

citrus <- filter(councils, council== "Girl Scouts of Citrus Council")

panhandle <-filter(councils, council == "Girl Scout Council of the Panhandle")

panhandle

gswcf <-filter(councils, council == "Girl Scouts of West Central Florida")

dim(southeast)

southeast <-filter(councils, council == "Girl Scouts of Southeast Florida")

dim(southeast)

tail(southeast, n=50)


gatewayQ2 <-filter(gradesUniqueQ2, council == "Girl Scouts of the Gateway Council")

girlCodeGatewayQ2<- sub("313", "", gatewayQ2$girlCode)

fixgirlCodeGatewayQ2<- sub("", "313", girlCodeGatewayQ2)

gatewayQ2$girlCode <- fixgirlCodeGatewayQ2


################Test

dim(gradesUniqueQ2) #1133

excludeGateway <- filter(gradesUniqueQ2, council != "Girl Scouts of the Gateway Council")

dim(excludeGateway) #N=860


gradesUniqueQ2<- rbind(excludeGateway, gatewayQ2)

dim(gradesUniqueQ2)

head(gradesUniqueQ2, n=100)

gradesUniqueQ2$girlCode




##################Reading###########################################

q2Reading <- gradesUniqueQ2[,c( 7,8, 18:35)]



#######Melt the data frame. 
mq2Reading <- melt(q2Reading, id.vars=c("girlCode", "council"))





#############Free Read############################

q2freeRead <- gradesUniqueQ2 [,c(7,8,36,37,38)]

table(q2freeRead$letterGrade)

grep("read", ignore.case=TRUE, q2freeRead$letterGrade, value=TRUE)




q2freeRead3 <- q2freeRead[grep("read", ignore.case=TRUE,q2freeRead$letterGrade),]



meltq2freeRead <-melt(q2freeRead3, id.vars=c("girlCode", "council") )

m


###Bind the data frames together. 
mq2Reading2 <-rbind(mq2Reading, meltq2freeRead)


###########Clean up the data################333
mq2Reading2 <-na.omit(mq2Reading2)


##########################Save the data frame######################33

saveRDS(mq2Reading2, "q2Reading.rds")


###Subset Lang Arts Courses

q2Lang <- gradesUniqueQ2 [, c(7,8,40:72)]

##### Melt the data frame
mq2Lang <-melt(q2Lang, id.vars=c("girlCode", "council"))


### Free Rangers Lang Arts

####Find the Lang Arts Courses
freelangQ2 <- gradesQ2[, c(7,8,73:75)]

table(freelangQ2$grade)

grep("lang", ignore.case=TRUE, freelangQ2$grade, value=TRUE)

freeLangQ21 <- freelangQ2[grep("lang", ignore.case=TRUE,freelangQ2$grade),]

grep("lang", ignore.case=TRUE, freelangQ4$grade, value=TRUE)

freeLangQ22 <- freelangQ2[grep("eng", ignore.case=TRUE,freelangQ2$grade),]



##############Melt the df###############3
meltedfreeLangQ2 <-melt(bindedfreeLangQ, id.vars=c("girlCode", "council"))

###################Slice the observations to the ones we need##############3

meltedfreeLangQ2 <- slice(meltedfreeLangQ2, 1:4)


#################Bind the data######################33

q2LangFinal <- rbind(mq2Lang, meltedfreeLangQ2)

q2LangFinal <- na.omit(q2LangFinal)

dim(q2LangFinal)

############Save the data frame################

saveRDS(q2LangFinal, "q2LangArts.rds")


###############Absences##############

####Unexcused Absences

q2Uabs <- gradesUniqueQ2[, c(7,8, 11)]

q2Uabs$unexusedAbs <-as.numeric(q2Uabs$unexusedAbs)

saveRDS(q2Uabs, "q2UnexcusedAbsences.rds")


#####Excused Absences

q2Eabs <-gradesUniqueQ2[, c(7,8,12)]

q2Eabs$excusedAbs <-as.numeric(q2Eabs$excusedAbs)

saveRDS(q2Eabs, "q2ExcusedAbsences")


####################In School Suspensions##############

q2Is <- gradesUniqueQ2[, c(7,8,14)]


q2Is$inSchoolSusp <- as.numeric(q2Is$inSchoolSusp)

saveRDS(q2IS, "q2InSchoolSuspensions.rds")




##################Out of School Suspensions#############3

q2Os <- gradesUniqueQ2[, c(7,8,15)]

q2Os$outofSchoolSusp <- as.numeric(q2Os$outofSchoolSusp)


saveRDS(q2OS, "q2OutOfSchoolSuspensions.rds")



#######Behavioral Referrals

q2Bev <- gradesUniqueQ2[, c(7,8,13)]


q2Bev$behaviorRef <-as.numeric(q2Bev$behaviorRef)

saveRDS(q2Bev, "q2BehaviorReferral.rds")



#################Expelled###########################

q2Exp <-gradesUniqueQ2[, c(7,8,16)]


saveRDS <-(q2Exp, "q2Expelled.rds")




