#### Load the Libraries
library(dplyr)
library(reshape2)


###Read the data frame
gradesQ3 <- read.csv("q3grades07082015.csv", skip=1)



### Demo Variables
colnames (gradesQ3) [7] <- "council"
colnames (gradesQ3) [8] <- "girlCode"
colnames (gradesQ3) [9] <- "schoolName"
colnames (gradesQ3) [10] <- "dateEnrolled"

#### Behavioral Variables
colnames (gradesQ3) [11] <- "unexusedAbs"
colnames (gradesQ3) [12] <- "excusedAbs"
colnames (gradesQ3) [13] <- "behaviorRef"
colnames (gradesQ3) [14] <- "inSchoolSusp"
colnames (gradesQ3) [15] <- "outofSchoolSusp"
colnames (gradesQ3) [16] <- "expelled"

### Reading Courses

colnames (gradesQ3) [18] <- "mjIntensRead"
colnames (gradesQ3) [19] <- "mjIntenseReadCareerPlaning"
colnames (gradesQ3) [20] <- "mjRead1"
colnames (gradesQ3) [21] <- "mjRead1Adv"
colnames (gradesQ3) [22] <- "mjRead2"
colnames (gradesQ3) [23] <- "mjRead2Adv"
colnames (gradesQ3) [24] <- "mjRead3"
colnames (gradesQ3) [25] <- "mjRead3Adv"
colnames (gradesQ3) [26] <- "mjDelaESOLRead"
colnames (gradesQ3) [27] <- "readFree1"
colnames (gradesQ3) [28] <- "readFree2"


### Lang Arts Courses

colnames (gradesQ3) [29] <- "mjLangArts1ESOL"
colnames (gradesQ3) [30] <- "mjLangArts2ESOL"
colnames (gradesQ3) [31] <- "mjLangArts3ESOL"
colnames (gradesQ3) [32] <- "mjDevelpmentalESOL"
colnames (gradesQ3) [33] <- "mjLangArts1"
colnames (gradesQ3) [34] <-"mjlangsArts1Adv"
colnames (gradesQ3) [35] <-"mjLangArts2"
colnames (gradesQ3) [36] <- "mjLangArts2Adv" 

colnames (gradesQ3) [37] <- "mjLangArts3"
colnames (gradesQ3) [38] <- "mjLangArts3Adv"
colnames (gradesQ3) [39] <- "mjEng2Cambsec2"
colnames (gradesQ3) [40] <- "mjIBLangArts1"
colnames (gradesQ3) [41] <- "mjEng2CamSec1"
colnames (gradesQ3) [42] <- "mjIBLangArts3"
colnames (gradesQ3) [43] <- "mjIBLangArts2"
colnames (gradesQ3) [44] <- "mjEng3Cambsec3"
colnames (gradesQ3) [45] <- "mjIntenseLangArts"
colnames (gradesQ3) [46] <- "freeLang1"
colnames (gradesQ3) [47] <- "freeLang2"


#######################Fix Girl code###################################


gradesQ3$girlCode <- toupper(gradesQ3$girlCode)

gradesQ3$council <- as.character(gradesQ3$council)

gradesQ3$girlCode <- as.character(gradesQ3$girlCode)


################Finished Data Entry####################################33

gradesq3 <- filter(gradesQ3, Finished == 1)



##############################Subset Duplicate Values##################

q3Dupes <-duplicated(gradesq3$girlCode) | duplicated(gradesq3$girlCode, fromLast=TRUE)

q3Dupes <-gradesq3[q3Dupes, ]





###################Duplicates#########################################


gradesUnique <- gradesq3 [!(duplicated(gradesq3$girlCode) | duplicated(gradesq3$girlCode, fromLast = TRUE)), ]



##############################Reading#####################################3

readingQ3 <- select(gradesUnique, 7:8, 18:26)


####Melt the data frame

mq3ReadingGrades <-melt(readingQ3, id.vars=c("girlCode","council"))






q3Reading <-na.omit(mq3ReadingGrades)

head(q3Reading)


saveRDS(q3Reading, file="q3Reading.rds")

Q3.reading <- readRDS("q3Reading.rds")

#####################Free Read########################################33

q3freeRead <- gradesUnique [,c(7,8,27,28)]

####Test to see the data
table(q3freeRead$readFree2)

grep("read", ignore.case=TRUE, q3freeRead$readFree2, value=TRUE)

#########This belongs to lang ARts
grep("lang", ignore.case=TRUE, q3freeRead$readFree2, value=TRUE)






#######################Language Arts########################

q3Lang <-select(gradesUnique, 7:8, 29:45)

##################Melt Lange

q3LangMelt <- melt(q3Lang, id.var=c("girlCode", "council"))







#############Free Lang Arts####################3


q3freeLang <- gradesUnique [,c(7,8,46,47)]

table(q3freeLang$freeLang2)


grep("lang", ignore.case=TRUE, q3freeLang$freeLang2, value=TRUE)

grep("read", ignore.case=TRUE, q3freeLang$freeLang2, value=TRUE)

grep("lang", ignore.case=TRUE, q3freeRead$readFree2, value=TRUE)

q3freeLang3 <- q3freeRead[grep("lang", ignore.case=TRUE, q3freeRead$readFree2),]

q3freeLang3 <- q3freeRead[grep("lang", ignore.case=TRUE,q3freeRead$readFree2),]


q3freeLang4 <- q3freeLang[grep("lang", ignore.case=TRUE,q3freeLang$freeLang2),]

colnames (q3freeLang3) [3] <- "variable"
colnames (q3freeLang3) [4] <- "value"

###################Bind the data frame#########################3

####Change to character seemed to work?
q3freeLang5$variable <-as.character(q3freeLang5$variable)

################Set the data frame from the bind##########3
q3freeLang5 <- arrange(q3freeLang3, girlCode, council, variable, value)

################Add the data frame#######################3
q3Langfinal <- rbind (q3LangMelt, q3freeLang5)

##############Removed the NA########################
q3Langfinal <-na.omit(q3Langfinal)


#################Save as RDS
saveRDS(q3Langfinal, file="q3LangArts.rds")

############################Behavior######################33



q3Behavior <-select(gradesUnique, 7:8, 11:16)

saveRDS (q3Behavior, file="q3Behavior.rds")

#####Unexcused Absences

q3unExcused <- select(gradesUnique, 7:8, 11)

q3unExcused$unexusedAbs <-as.numeric(q3unExcused$unexusedAbs)

saveRDS(q3unExcused, file="q3unExcusedAbs.rds")

#######Excused Absences

q3ExcusedAbs <- select(gradesUnique, 7:8, 12)

q3ExcusedAbs$excusedAbs <-as.numeric(q3ExcusedAbs$excusedAbs)


saveRDS(q3ExcusedAbs, file="q3ExcusedAbs.rds")

###############Behavioral Referral

q3BehavRef <- select(gradesUnique, 7:8, 13)

q3BehavRef$behaviorRef <- as.numeric(q3BehavRef$behaviorRef)

saveRDS(q3BehavRef, file="q3BehavRef.rds")

##################In-School Suspension##################

q3InSchoolSusp <-select(gradesUnique, 7:8, 14)

q3InSchoolSusp$inSchoolSusp <- as.numeric(q3InSchoolSusp$inSchoolSusp)

save(q3InSchoolSusp, file="q3InSchoolSusp.rds")

###############Out of School Suspensions############################

q3OutofSchoolSusp <- select(gradesUnique, 7:8, 15)

q3OutofSchoolSusp$outofSchoolSusp <- as.numeric(q3OutofSchoolSusp$outofSchoolSusp)

save(q3OutofSchoolSusp, file="q3OutofSchoolSusp.rds")

###################Expelled###################3333

q3Expelled <- select (gradesUnique, 7:8, 16)

####Save Object

save(q3Expelled, file="q3Expelled.rds")


save(gradesUnique, file="q30619.RDS")
