### Set Working Directory
setwd("C:/Users/kevin/Dropbox/GetReal/Data/July 2015/grades/q4")

#### Load the Libraries
library(dplyr)
library(reshape2)

####
gradesQ4 <-read.csv("gradesQ407092015.csv", skip=1)



### Demo Variables
colnames (gradesQ4) [7] <- "council"
colnames (gradesQ4) [8] <- "girlCode"
colnames (gradesQ4) [9] <- "schoolName"
colnames (gradesQ4) [10] <- "dateEnrolled"


#### Behavioral Variables
colnames (gradesQ4) [11] <- "unexusedAbs"
colnames (gradesQ4) [12] <- "excusedAbs"
colnames (gradesQ4) [13] <- "behaviorRef"
colnames (gradesQ4) [14] <- "inSchoolSusp"
colnames (gradesQ4) [15] <- "outofSchoolSusp"
colnames (gradesQ4) [16] <- "expelled"
colnames (gradesQ4) [17] <- "promoted"

#########Reading Grades
colnames (gradesQ4) [19] <- "mjIntensRead_Quarter"
colnames (gradesQ4) [20] <- "mjIntensRead_Semester"

colnames (gradesQ4) [21] <- "mjIntenseReadCareerPlaning_Quarter"
colnames (gradesQ4) [22] <- "mjIntenseReadCareerPlaning_Semester"


colnames (gradesQ4) [23] <- "mjRead1_Quarter"
colnames (gradesQ4) [24] <- "mjRead1_Semester"

colnames (gradesQ4) [25] <- "mjRead1Adv_Quarter"
colnames (gradesQ4) [26] <- "mjRead1Adv_Semester"


colnames (gradesQ4) [27] <- "mjRead2_Quarter"
colnames (gradesQ4) [28] <- "mjRead2_Semester"


colnames (gradesQ4) [29] <- "mjRead2Adv_Quarter"
colnames (gradesQ4) [30] <- "mjRead2Adv_Semester"

colnames (gradesQ4) [31] <- "mjRead3_Quarter"
colnames (gradesQ4) [32] <- "mjRead3_Semester"

colnames (gradesQ4) [33] <- "mjRead3Adv_Quarter"
colnames (gradesQ4) [34] <- "mjRead3Adv_Semester"


colnames (gradesQ4) [35] <- "mjDelaESOLRead_Quarter"
colnames (gradesQ4) [36] <- "mjDelaESOLRead_Semester"


colnames (gradesQ4) [37] <- "readFree1_Quarter"
colnames (gradesQ4) [38] <- "readFree2_Semester"
colnames (gradesQ4) [39] <- "letterGrade" 


### Lang Arts Courses

colnames (gradesQ4) [40] <- "mjLangArts1ESOL_Quarter"
colnames (gradesQ4) [41] <- "mjLangArts1ESOL_Semester"

colnames (gradesQ4) [42] <- "mjLangArts2ESOL_Quarter"
colnames (gradesQ4) [43] <- "mjLangArts2ESOL_Semester"

colnames (gradesQ4) [44] <- "mjLangArts3ESOL_Quarter"
colnames (gradesQ4) [45] <- "mjLangArts3ESOL_Semester"

colnames (gradesQ4) [46] <- "mjDevelpmentalESOL_Quarter"
colnames (gradesQ4) [47] <- "mjDevelpmentalESOL_Semester"

colnames (gradesQ4) [48] <- "mjLangArts1_Quarter"
colnames (gradesQ4) [49] <-  "mjLangArts1_Semester"


colnames (gradesQ4) [50] <-"mjlangsArts1Adv_Quarter"
colnames (gradesQ4) [51] <-"mjlangsArts1Adv_Semester"


colnames (gradesQ4) [52] <-"mjLangArts2_Quarter"
colnames (gradesQ4) [53] <-"mjLangArts2_Semester"


colnames (gradesQ4) [54] <- "mjLangArts2Adv_Quarter" 
colnames (gradesQ4) [55] <- "mjLangArts2Adv_Semester" 


colnames (gradesQ4) [56] <- "mjLangArts3_Quarter"
colnames (gradesQ4) [57] <- "mjLangArts3_Semester"


colnames (gradesQ4) [58] <- "mjLangArts3Adv_Quarter"
colnames (gradesQ4) [59] <- "mjLangArts3Adv_Semester"

colnames (gradesQ4) [60] <- "mjEng2Cambsec2_Quarter"
colnames (gradesQ4) [61] <- "mjEng2Cambsec2_Semester"

colnames (gradesQ4) [62] <- "mjIBLangArts1_Quarter"
colnames (gradesQ4) [63] <- "mjIBLangArts1_Semester"

colnames (gradesQ4) [64] <- "mjEng2CamSec1_Quarter"
colnames (gradesQ4) [65] <- "mjEng2CamSec1_Semester"

colnames (gradesQ4) [66] <- "mjIBLangArts3_Quarter"
colnames (gradesQ4) [67] <- "mjIBLangArts3_Semester"

colnames (gradesQ4) [68] <- "mjIBLangArts2_Quarter"
colnames (gradesQ4) [69] <- "mjIBLangArts2_Semester"


colnames (gradesQ4) [70] <- "mjEng3Cambsec3_Quarter"
colnames (gradesQ4) [71] <- "mjEng3Cambsec3_Semester"


colnames (gradesQ4) [72] <- "mjIntenseLangArts_Quarter"
colnames (gradesQ4) [73] <- "mjIntenseLangArts_Semester"

colnames (gradesQ4) [74] <- "freeLang1_Quarter"
colnames (gradesQ4) [75] <- "freeLang2_Semester"
colnames (gradesQ4) [76] <- "grade"


#######################Fix Girl code###################################


gradesQ4$girlCode <- toupper(gradesQ4$girlCode)

gradesQ4$council <- as.character(gradesQ4$council)

gradesQ4$girlCode <- as.character(gradesQ4$girlCode)


################Finished Data Entry####################################

gradesQ4 <- filter(gradesQ4, Finished == 1)


##############################Subset Duplicate Values##################

q4Dupes <-duplicated(gradesQ4$girlCode) | duplicated(gradesQ4$girlCode, fromLast=TRUE)

q4Dupes <-gradesQ4[q4Dupes, ]




################### Rid Duplicates#########################################


gradesUniqueQ4 <- gradesQ4 [!(duplicated(gradesQ4$girlCode) | duplicated(gradesQ4$girlCode, fromLast = TRUE)), ]


#####################test

councilsQ4 <-select(gradesUniqueQ4, council, girlCode)

head(councilsQ4A, n=50)

citrus <- filter(councilsQ4, council== "Girl Scouts of Citrus Council")

gateway <-filter(councilsQ4, council == "Girl Scouts of the Gateway Council")

panhandle <-filter(councilsQ4, council == "Girl Scout Council of the Panhandle")

panhandle

gswcf <-filter(councilsQ4, council == "Girl Scouts of West Central Florida")

dim(southeast)

southeast <-filter(councilsQ4, council == "Girl Scouts of Southeast Florida")

southeast

tail(southeast, n=50)


gatewayQ4 <-filter(gradesUniqueQ4, council == "Girl Scouts of the Gateway Council")

girlCodeGatewayQ4<- sub("313", "", gatewayQ4$girlCode)

fixgirlCodeGatewayQ4<- sub("", "313", girlCodeGatewayQ4)

gatewayQ4$girlCode <- fixgirlCodeGatewayQ4


dim(gradesUniqueQ4) #N=794

excludeGatewayQ4 <- filter(gradesUniqueQ4, council != "Girl Scouts of the Gateway Council")

dim(excludeGatewayQ4) #N=529


gradesUniqueQ4<- rbind(excludeGatewayQ4, gatewayQ4)

dim(gradesUniqueQ4)

##################Reading###########################################

q4Reading <- gradesUniqueQ4[,c( 7,8, 19:36)]


#######Melt the data frame. 
mq4Reading <- melt(q4Reading, id.vars=c("girlCode", "council"))



#############Free Read############################

q4freeRead <- gradesUniqueQ4 [,c(7,8,37,38,39)]

table(q4freeRead$letterGrade)

grep("read", ignore.case=TRUE, q4freeRead$readFree1_Quarter, value=TRUE)

grep("read", ignore.case=TRUE, q4freeRead$letterGrade, value=TRUE)



q4freeRead3 <- q4freeRead[grep("read", ignore.case=TRUE,q4freeRead$letterGrade),]


mq4FreeRead <- melt(q4freeRead3,id.vars=c("girlCode", "council") )

mq5FreeRead <- slice(mq4FreeRead,1:2 )




###Bind the data frames together. 
mq4Reading2 <-rbind(mq4Reading, mq5FreeRead)

#################Clean up the data
mq4Reading2 <- na.omit(mq4Reading2)


saveRDS(mq4Reading, "q4Reading.rds")

###Subset Lang Arts Courses

q4Lang <- gradesUniqueQ4 [, c(7,8,40:73)]

##### Melt the data frame
mq4Lang <-melt(q4Lang, id.vars=c("girlCode", "council"))



### Free Rangers Lang Arts

####Find the Lang Arts Courses
freelangQ4 <- gradesQ4[, c(7,8,73,75,76)]


table(freelangQ4$grade)

####Clean it up

grep("lang", ignore.case=TRUE, freelangQ4$grade, value=TRUE)

freeLangQ4 <- freelangQ4[grep("lang", ignore.case=TRUE,freelangQ4$grade),]

######Melt it down

mfreeLangQ4 <-melt(freeLangQ4, id.vars=c("girlCode", "council"))

#######Slice the variables down

mfreeLangQ5 <-slice(mfreeLangQ4, 6:8)

#############Bind the data frames###########33

q4LangFinal <- rbind(mq4Lang, mfreeLangQ5)

#########Omit the NA###########

q4LangFinal <- na.omit(q4LangFinal)

#############Save the data frame#save###########3

saveRDS(q4LangFinal, "q4Lang.rds")


with(q4LangFinal, tapply(value, council, mean))



###############Absences##############

####Unexcused Absences

q4Uabs <- gradesUniqueQ4[, c(7,8, 11)]

q4Uabs$unexusedAbs <-as.numeric(q4Uabs$unexusedAbs)

saveRDS(q4Uabs, "q4UnexcusedAbsences.rds")


#####Excused Absences

q4Eabs <-gradesUniqueQ4[, c(7,8,12)]

q4Eabs$excusedAbs <-as.numeric(q4Eabs$excusedAbs)

saveRDS(q4Eabs, "q4ExcusedAbsences.rds")


####################In School Suspensions##############

q4Is <- gradesUniqueQ4[, c(7,8,14)]


q4Is$inSchoolSusp <- as.numeric(q4Is$inSchoolSusp)


saveRDS(q4Is, "In School Suspensions.rds")


##################Out of School Suspensions#############3

q4Os <- gradesUniqueQ4[, c(7,8,15)]

q4Os$outofSchoolSusp <- as.numeric(q4Os$outofSchoolSusp)

saveRDS(q4Os, "Out of School Suspensions.rds")




#######Behavioral Referrals

q4Bev <- gradesUniqueQ4[, c(7,8,13)]

q4Bev$behaviorRef <-as.numeric(q4Bev$behaviorRef)

saveRDS(q4Bev, "q4Behavioral Referrals.rds")



#################Expelled###########################

q4Exp <-gradesUniqueQ4[, c(7,8,16)]

saveRDS(q4Exp, "q4Expelled.rds")

table(q4Exp$expelled)


################Prompoted########################3

q4Promoted <-gradesUniqueQ4[, c(7,8, 17)]

saveRDS(q4Promoted, "q4Promoted.rds")

table(q4Promoted$promoted)







