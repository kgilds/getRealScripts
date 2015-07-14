setwd("C:/Users/kevin/Dropbox/GetReal/Data/July 2015/grades")

#### Load the Libraries
library(dplyr)
library(reshape2)


###Read the data frame
grades <- read.csv("gradesQ107062015.csv", skip=1)



### Demo Variables
colnames (grades) [7] <- "council"
colnames (grades) [8] <- "girlCode"
colnames (grades) [9] <- "schoolName"
colnames (grades) [10] <- "dateEnrolled"

#### Behavioral Variables
colnames (grades) [11] <- "unexusedAbs"
colnames (grades) [12] <- "excusedAbs"
colnames (grades) [13] <- "behaviorRef"
colnames (grades) [14] <- "inSchoolSusp"
colnames (grades) [15] <- "outofSchoolSusp"
colnames (grades) [16] <- "expelled"

### Reading Courses

colnames (grades) [18] <- "mjIntensRead"
colnames (grades) [19] <- "mjIntenseReadCareerPlaning"
colnames (grades) [20] <- "mjRead1"
colnames (grades) [21] <- "mjRead1Adv"
colnames (grades) [22] <- "mjRead2"
colnames (grades) [23] <- "mjRead2Adv"
colnames (grades) [24] <- "mjRead3"
colnames (grades) [25] <- "mjRead3Adv"
colnames (grades) [26] <- "mjDelaESOLRead"
colnames (grades) [27] <- "readFree1"
colnames (grades) [28] <- "readFree2"


### Lang Arts Courses

colnames (grades) [29] <- "mjLangArts1ESOL"
colnames (grades) [30] <- "mjLangArts2ESOL"
colnames (grades) [31] <- "mjLangArts3ESOL"
colnames (grades) [32] <- "mjDevelpmentalESOL"
colnames (grades) [33] <- "mjLangArts1"
colnames (grades) [34] <-"mjlangsArts1Adv"
colnames (grades) [35] <-"mjLangArts2"
colnames (grades) [36] <- "mjLangArts2Adv" 

colnames (grades) [37] <- "mjLangArts3"
colnames (grades) [38] <- "mjLangArts3Adv"
colnames (grades) [39] <- "mjEng2Cambsec2"
colnames (grades) [40] <- "mjIBLangArts1"
colnames (grades) [41] <- "mjEng2CamSec1"
colnames (grades) [42] <- "mjIBLangArts3"
colnames (grades) [43] <- "mjIBLangArts2"
colnames (grades) [44] <- "mjEng3Cambsec3"
colnames (grades) [45] <- "mjIntensLangArts"
colnames (grades) [46] <- "freeLang1"
colnames (grades) [47] <- "freeLang2"


#######################Fix Girl code###################################


grades$girlCode <- toupper(grades$girlCode)

grades$council <- as.character(grades$council)

grades$girlCode <- as.character(grades$girlCode)


################Finished Data Entry####################################33

gradesq1 <- filter(grades, Finished == 1)



##############################Subset Duplicate Values##################

q1Dupes <-duplicated(gradesq1$girlCode) | duplicated(gradesq1$girlCode, fromLast=TRUE)

q1Dupes <-gradesq1[q1Dupes, ]





###################Duplicates#########################################


gradesUnique <- gradesq1 [!(duplicated(gradesq1$girlCode) | duplicated(gradesq1$girlCode, fromLast = TRUE)), ]


#######################3

gradesUnique$girlCode





###############Reading Clean Up###############################################################

q1Reading <- select(gradesUnique,council, girlCode, mjIntensRead, mjIntenseReadCareerPlaning, mjRead1, mjRead1Adv, mjRead2, mjRead2Adv, mjRead3, mjRead3Adv, mjDelaESOLRead)



names(q1Reading)

#######Melt the data frame. 
mq1Reading <- melt(q1Reading, id.vars=c("girlCode", "council"))





#############Free Read############################


q1freeRead <- gradesUnique [,c(7,8,27,28)]


grep("read", ignore.case=TRUE, q1freeRead$readFree2, value=TRUE)

q1freeRead <- gradesUnique [,c(7,8,27,28)]


grep("lang", ignore.case=TRUE, q1freeRead$readFree2, value=TRUE)


q1freeRead3 <- q1freeRead[grep("read", ignore.case=TRUE,q1freeRead$readFree2),]


q1freeRead3 <- q1freeRead[grep("read", ignore.case=TRUE,q1freeRead$readFree2),]

colnames (q1freeRead3) [4] <-"variable"
colnames (q1freeRead3) [3] <-"value"




###Bind the data frames together. 
mq1Reading2 <-rbind(mq1Reading, q1freeRead3)



####################change column names
colnames (mq1Reading2) [4] <-"readingGrade"
colnames (mq1Reading2) [3] <- "readingCourses"

##############Save Quarter 1 Reading###############3
saveRDS(mq1Reading2, "quarter1reading.rds")


dim(mq1Reading2) #n=9383
mq1Reading2 <-na.omit(mq1Reading2)
dim(mq1Reading2) #N=481
head(mq1Reading2)





#################################Lang Arts############################3

###Subset Lang Arts Courses

q1Lang <- gradesUnique [, c(7,8, 29, 30, 31, 32, 33, 34, 35, 36, 37,38, 39, 40, 41, 42, 43, 44, 45)]

##### Melt the data frame
mq1Lang <-melt(q1Lang, id.vars=c("girlCode", "council"))


colnames (mq1Lang) [4] <- "langArtsGrade"
colnames (mq1Lang) [3] <- "langArtsCourses"





q1freeLang <- gradesUnique [,c(7,8,46,47)]


q1freeLang2 <- q1freeLang[grep("lang",ignore.case=TRUE, q1freeLang$freeLang2),]



colnames (q1freeLang2) [4] <-"langArtsCourses"
colnames (q1freeLang2) [3] <-"langArtsGrade"


###################Bind the data frames

mq1Lang2 <-rbind(mq1Lang, q1freeLang2)

mq1Lang2 <-na.omit(mq1Lang)

head(mq1Lang2)
dim(mq1Lang2)

###########
saveRDS(mq1Lang2, "quarter1Lang.rds")

########### Unexcused Absences

q1Uabs <- gradesUnique[, c(7,8, 11)]


q1Uabs$unexusedAbs <- as.numeric(q1Uabs$unexusedAbs)

##########################Save file#######################3

saveRDS(q1Uabs, "q1UnexcusedAbs.rds")


#######Excused Absences

q1Exabs <- gradesUnique[, c(7,8,12)]


q1Exabs$excuseddAbs <- as.numeric(q1Exabs$excusedAbs) 

saveRDS(q1Exabs,"q1ExcusedAbs.rds")

#######Behavioral Referrals

q1Bev <- gradesUnique[, c(7,8,13)]


q1Bev$behaviorRef <-as.numeric(q1Bev$behaviorRef)


saveRDS(q1Bev, "q1BehaviorReferrals.rds")




####################In School Suspensions##############

q1Is <- gradesUnique[, c(7,8,14)]


q1Is$inSchoolSusp <- as.numeric(q1Is$inSchoolSusp)


saveRDS(q1Is, "q1InSchoolSusp.rds")
##################Out of School Suspensions#############3

q1Os <- gradesUnique[, c(7,8,15)]

q1Os$outofSchoolSusp <- as.numeric(q1Os$outofSchoolSusp)


saveRDS(q1Os, "q1OutOfSchoolSuspensions.rds")

#################Expelled###########################

q1Exp <-gradesUnique[, c(7,8,16)]

saveRDS(q1Exp, "q1Expelled.rds")

