### Set Working Directory
setwd("C:/Users/kevin/Dropbox/GetReal/Data/July 2015/grades/q4")

#### Load the Libraries
library(dplyr)
library(reshape2)

####
gradesQ4A <-read.csv("gradesQ4A07122015.csv", skip=1)

### Demo Variables
colnames (gradesQ4A) [7] <- "council"
colnames (gradesQ4A) [8] <- "girlCode"
colnames (gradesQ4A) [9] <- "schoolName"
colnames (gradesQ4A) [10] <- "dateEnrolled"


#### Behavioral Variables
colnames (gradesQ4A) [11] <- "unexusedAbs"
colnames (gradesQ4A) [12] <- "excusedAbs"
colnames (gradesQ4A) [13] <- "behaviorRef"
colnames (gradesQ4A) [14] <- "inSchoolSusp"
colnames (gradesQ4A) [15] <- "outofSchoolSusp"
colnames (gradesQ4A) [16] <- "expelled"

#########Reading Grades
colnames (gradesQ4A) [18] <- "mjIntensRead_Quarter"
colnames (gradesQ4A) [19] <- "mjIntensRead_Semester"

colnames (gradesQ4A) [20] <- "mjIntenseReadCareerPlaning_Quarter"
colnames (gradesQ4A) [21] <- "mjIntenseReadCareerPlaning_Semester"


colnames (gradesQ4A) [22] <- "mjRead1_Quarter"
colnames (gradesQ4A) [23] <- "mjRead1_Semester"

colnames (gradesQ4A) [24] <- "mjRead1Adv_Quarter"
colnames (gradesQ4A) [25] <- "mjRead1Adv_Semester"


colnames (gradesQ4A) [26] <- "mjRead2_Quarter"
colnames (gradesQ4A) [27] <- "mjRead2_Semester"


colnames (gradesQ4A) [28] <- "mjRead2Adv_Quarter"
colnames (gradesQ4A) [29] <- "mjRead2Adv_Semester"

colnames (gradesQ4A) [30] <- "mjRead3_Quarter"
colnames (gradesQ4A) [31] <- "mjRead3_Semester"

colnames (gradesQ4A) [32] <- "mjRead3Adv_Quarter"
colnames (gradesQ4A) [33] <- "mjRead3Adv_Semester"


colnames (gradesQ4A) [34] <- "mjDelaESOLRead_Quarter"
colnames (gradesQ4A) [35] <- "mjDelaESOLRead_Semester"


colnames (gradesQ4A) [36] <- "readFree1_Quarter"
colnames (gradesQ4A) [37] <- "readFree2_Semester"
colnames (gradesQ4A) [38] <- "letterGrade" 


### Lang Arts Courses

colnames (gradesQ4A) [39] <- "mjLangArts1ESOL_Quarter"
colnames (gradesQ4A) [40] <- "mjLangArts1ESOL_Semester"

colnames (gradesQ4A) [41] <- "mjLangArts2ESOL_Quarter"
colnames (gradesQ4A) [42] <- "mjLangArts2ESOL_Semester"

colnames (gradesQ4A) [43] <- "mjLangArts3ESOL_Quarter"
colnames (gradesQ4A) [44] <- "mjLangArts3ESOL_Semester"

colnames (gradesQ4A) [45] <- "mjDevelpmentalESOL_Quarter"
colnames (gradesQ4A) [46] <- "mjDevelpmentalESOL_Semester"

colnames (gradesQ4A) [47] <- "mjLangArts1_Quarter"
colnames (gradesQ4A) [48] <-  "mjLangArts1_Semester"


colnames (gradesQ4A) [49] <-"mjlangsArts1Adv_Quarter"
colnames (gradesQ4A) [50] <-"mjlangsArts1Adv_Semester"


colnames (gradesQ4A) [51] <-"mjLangArts2_Quarter"
colnames (gradesQ4A) [52] <-"mjLangArts2_Semester"


colnames (gradesQ4A) [53] <- "mjLangArts2Adv_Quarter" 
colnames (gradesQ4A) [54] <- "mjLangArts2Adv_Semester" 


colnames (gradesQ4A) [55] <- "mjLangArts3_Quarter"
colnames (gradesQ4A) [56] <- "mjLangArts3_Semester"


colnames (gradesQ4A) [57] <- "mjLangArts3Adv_Quarter"
colnames (gradesQ4A) [58] <- "mjLangArts3Adv_Semester"

colnames (gradesQ4A) [59] <- "mjEng2Cambsec2_Quarter"
colnames (gradesQ4A) [60] <- "mjEng2Cambsec2_Semester"

colnames (gradesQ4A) [61] <- "mjIBLangArts1_Quarter"
colnames (gradesQ4A) [62] <- "mjIBLangArts1_Semester"

colnames (gradesQ4A) [63] <- "mjEng2CamSec1_Quarter"
colnames (gradesQ4A) [64] <- "mjEng2CamSec1_Semester"

colnames (gradesQ4A) [65] <- "mjIBLangArts3_Quarter"
colnames (gradesQ4A) [66] <- "mjIBLangArts3_Semester"

colnames (gradesQ4A) [67] <- "mjIBLangArts2_Quarter"
colnames (gradesQ4A) [68] <- "mjIBLangArts2_Semester"


colnames (gradesQ4A) [69] <- "mjEng3Cambsec3_Quarter"
colnames (gradesQ4A) [70] <- "mjEng3Cambsec3_Semester"


colnames (gradesQ4A) [71] <- "mjIntenseLangArts_Quarter"
colnames (gradesQ4A) [72] <- "mjIntenseLangArts_Semester"

colnames (gradesQ4A) [73] <- "freeLang1_Quarter"
colnames (gradesQ4A) [74] <- "freeLang2_Semester"
colnames (gradesQ4A) [75] <- "grade"


#######################Fix Girl code###################################


gradesQ4A$girlCode <- toupper(gradesQ4A$girlCode)

gradesQ4A$council <- as.character(gradesQ4A$council)

gradesQ4A$girlCode <- as.character(gradesQ4A$girlCode)


################Finished Data Entry####################################

gradesQ4A <- filter(gradesQ4A, Finished == 1)


##############################Subset Duplicate Values##################

q4ADupes <-duplicated(gradesQ4A$girlCode) | duplicated(gradesQ4A$girlCode, fromLast=TRUE)

q4ADupes <-gradesQ4A[q4ADupes, ]




################### Rid Duplicates#########################################


gradesUniqueQ4A <- gradesQ4A [!(duplicated(gradesQ4A$girlCode) | duplicated(gradesQ4A$girlCode, fromLast = TRUE)), ]

#####################test

councilsQ4A <-select(gradesUniqueQ4A, council, girlCode)

head(councilsQ4A, n=50)

citrus <- filter(councilsQ4A, council== "Girl Scouts of Citrus Council")

gateway <-filter(councilsQ4A, council == "Girl Scouts of the Gateway Council")

panhandle <-filter(councilsQ4A, council == "Girl Scout Council of the Panhandle")

panhandle

gswcf <-filter(councilsQ4A, council == "Girl Scouts of West Central Florida")

dim(southeast)

southeast <-filter(councilsQ4A, council == "Girl Scouts of Southeast Florida")

dim(southeast)

tail(southeast, n=50)


gatewayQ4A <-filter(gradesUniqueQ4A, council == "Girl Scouts of the Gateway Council")

girlCodeGatewayQ4A<- sub("313", "", gatewayQ4A$girlCode)

fixgirlCodeGatewayQ4A<- sub("", "313", girlCodeGatewayQ4A)

gatewayQ4A$girlCode <- fixgirlCodeGatewayQ4A


################Test

dim(gradesUniqueQ4A) #N=267

excludeGatewayQ4A <- filter(gradesUniqueQ4A, council != "Girl Scouts of the Gateway Council")

dim(excludeGatewayQ4A) #N=248


gradesUniqueQ4A<- rbind(excludeGatewayQ4A, gatewayQ4A)

dim(gradesUniqueQ4A) # N=267


head(gradesUniqueQ4A, n=100)


###########Visual Insepction####################
gradesUniqueQ4A$girlCode


table(gradesUniqueQ4A$council)

##################Reading###########################################

q4AReading <- gradesUniqueQ4A[,c( 7,8, 18:35)]



#######Melt the data frame. 
mq4AReading <- melt(q4AReading, id.vars=c("girlCode", "council"))





#############Free Read############################

q4AfreeRead <- gradesUniqueQ4A [,c(7,8,36,37,38)]

table(q4AfreeRead$letterGrade)

grep("read", ignore.case=TRUE, q4AfreeRead$letterGrade, value=TRUE)




q4AfreeRead3 <- q4AfreeRead[grep("read", ignore.case=TRUE,q4AfreeRead$letterGrade),]



meltq4AfreeRead <-melt(q4AfreeRead3, id.vars=c("girlCode", "council") )

m

#################Take the relevant data###################3

q4AfreeRead4 <-slice(meltq4AfreeRead, 1:4)

#################Bind the data Sets#####################3

q4AReading <-rbind( mq4AReading, q4AfreeRead4)

###########Clean up the data################333
q4AReading <-na.omit(q4AReading)


##########################Save the data frame######################33

saveRDS(q4AReading, "q4AReading.rds")


###Subset Lang Arts Courses

q4ALang <- gradesUniqueQ4A [, c(7,8,40:72)]

##### Melt the data frame
mq4ALang <-melt(q4ALang, id.vars=c("girlCode", "council"))


### Free Rangers Lang Arts

####Find the Lang Arts Courses
freelangQ4A <- gradesQ4A[, c(7,8,73:75)]

table(freelangQ4A$grade)

grep("lang", ignore.case=TRUE, freelangQ4A$grade, value=TRUE)

freeLangQ4A1 <- freelangQ4A[grep("lang", ignore.case=TRUE,freelangQ4A$grade),]

grep("lang", ignore.case=TRUE, freelangQ4$grade, value=TRUE)

freeLangQ4A2 <- freelangQ2[grep("eng", ignore.case=TRUE,freelangQ4A$grade),]



##############Melt the df###############3
meltedfreeLangQ4A <-melt(freeLangQ4A1, id.vars=c("girlCode", "council"))

###################Slice the observations to the ones we need##############3

meltedfreeLangQ4A <- slice(meltedfreeLangQ4A, 1:8)


#################Bind the data######################33

q4ALangFinal <- rbind(mq4ALang, meltedfreeLangQ4A)

q4ALangFinal <- na.omit(q4ALangFinal)



############Save the data frame################

saveRDS(q4ALangFinal, "q4ALangArts.rds")


###############Absences##############

####Unexcused Absences

q4AUabs <- gradesUniqueQ4A[, c(7,8, 11)]

q4AUabs$unexusedAbs <-as.numeric(q4AUabs$unexusedAbs)

saveRDS(q4AUabs, "q4AUnexcusedAbsences.rds")


#####Excused Absences

q4AEabs <-gradesUniqueQ4A[, c(7,8,12)]

q4AEabs$excusedAbs <-as.numeric(q4AEabs$excusedAbs)

saveRDS(q4AEabs, "q4AEAbs.rds")


####################In School Suspensions##############

q4AIs <- gradesUniqueQ4A[, c(7,8,14)]


q4AIs$inSchoolSusp <- as.numeric(q4AIs$inSchoolSusp)

saveRDS(q4AIs, "q4AInSchoolSuspensions.rds")




##################Out of School Suspensions#############3

q4AOs <- gradesUniqueQ4A[, c(7,8,15)]

q4AOs$outofSchoolSusp <- as.numeric(q4AOs$outofSchoolSusp)


saveRDS(q4AOs, "q4AOutOfSchoolSuspensions.rds")



#######Behavioral Referrals

q4ABev <- gradesUniqueQ4A[, c(7,8,13)]


q4ABev$behaviorRef <-as.numeric(q4ABev$behaviorRef)

saveRDS(q4ABev, "q4ABehaviorReferral.rds")



#################Expelled###########################

q4AExp <-gradesUniqueQ4A[, c(7,8,16)]


saveRDS(q4AExp, "q4AExpelled.rds")

