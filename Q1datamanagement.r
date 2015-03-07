setwd("C:/Users/kevin/Dropbox/GetReal/Data/Raw Data/December2014/grades")

#### Load the Libraries
library(dplyr)
library(reshape2)


###Read the data frame
grades <- read.csv("grades12271.csv", skip=1)

#### Reade the Name of the columns
names(grades)

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
colnames (grades) [45] <- "mjIntenseLangArts"
colnames (grades) [46] <- "freeLang1"
colnames (grades) [47] <- "freeLang2"


#######################Fix Girl code###################################


grades$girlCode <- toupper(grades$girlCode)

grades$council <- as.character(grades$council)

grades$girlCode <- as.character(grades$girlCode)


################Finished Data Entry####################################33

gradesq1 <- filter(grades, Finished == 1)


dim(gradesq1)


###################Duplicates#########################################


gradesUnique <- gradesq1 [!(duplicated(gradesq1$girlCode) | duplicated(gradesq1$girlCode, fromLast = TRUE)), ]

dim(gradesUnique)


write.csv(gradesUnique, "gradesUnique.csv")


###############Reading Clean Up###############################################################

q1Reading <- select(gradesUnique,girlCode, council, mjIntensRead, mjIntenseReadCareerPlaning, mjRead1, mjRead1Adv, mjRead2, mjRead2Adv, mjRead3, mjRead3Adv, mjDelaESOLRead)



names(q1Reading)

#######Melt the data frame. 
mq1Reading <- melt(q1Reading, id.vars=c("girlCode", "council"))

####Change value to factor. 
mq1Reading$value <- as.factor(mq1Reading$value)


names(mq1Reading)

###change Labels on the levels
levels(mq1Reading$value) <- c("F","D", "C", "B", "A")


#############Free Read############################

q1freeRead <- q1 [,c(7,8,27,28)]


grep("read", ignore.case=TRUE, q1freeRead$readFree2, value=TRUE)


q1freeRead3 <- q1freeRead[grep("read", ignore.case=TRUE,q1freeRead$readFree2),]

colnames (q1freeRead3) [4] <-"variable"
colnames (q1freeRead3) [3] <-"value"



####Change value to factor. 
q1freeRead3$value <- as.factor(q1freeRead3$value)



###change Labels on the levels
levels(q1freeRead3$value) <- c("F","D", "C", "B", "A")

###Bind the data frames together. 
mq1Reading2 <-rbind(mq1Reading, q1freeRead3)



#### change the name of the Columns to set up for Merging to database########################
names(mq1Reading2)

dim(mq1Reading2)

head(mq1Reading2)

colnames (mq1Reading2) [4] <-"readingGrade"
colnames (mq1Reading2) [3] <- "readingCourses"


######Read Grade Summary
q1Reading <-with(mq1Reading2, table(girlCode,readingGrade))

q1Reading

dim(q1Reading)

saveRDS(q1Reading, file="q1Reading.rds")



q1Reading <-as.data.frame(q1Reading)


names(q1Reading)

q1Reading <- filter(q1Reading, Freq >=1)


summary(q1Reading)

tail(q1Reading)





####Summary by Council#################
with(mq1Reading2,table(council, value))





#################################Lang Arts############################3

###Subset Lang Arts Courses

q1Lang <- gradesUnique [, c(7,8, 29, 30, 31, 32, 33, 34, 35, 36, 37,38, 39, 40, 41, 42, 43, 44, 45)]

##### Melt the data frame
mq1Lang <-melt(q1Lang, id.vars=c("girlCode", "council"))

######Convert to factor
mq1Lang$value <-as.factor(mq1Lang$value)

#######Label the levels
levels(mq1Lang$value) <- c("F", "D", "C", "B", "A")


names(mq1Lang)

colnames (mq1Lang) [4] <- "langArtsGrade"
colnames (mq1Lang) [3] <- "langArtsCourses"

########

names(mq1Lang)

q1langArtsgrade <-with(mq1Lang, table(girlCode, langArtsGrade))

q1langArtsgrade <- as.data.frame(q1langArtsgrade)

q1langArtsgrade <-filter(q1langArtsgrade, Freq >=1)

saveRDS(q1langArtsgrade, file="q1langArts.rds")

head(q1langArtsgrade)

summary(q1langArtsgrade)

SaveRDS()


q1$freeLang2


#####Grade summary by council
with(mq1Lang, table(council, value))

########### Unexcused Absences

q1Uabs <- gradesUnique[, c(7,8, 11)]

head(q1Uabs)

summary(q1Uabs)

str(q1Uabs)

q1Uabs$unexusedAbs <- as.numeric(q1Uabs$unexusedAbs)

with(q1Uabs, tapply(unexusedAbs, council, summary))

with(q1Uabs,table(council, unexusedAbs))



with(q1Uabs, table(council,unexusedAbs >= 5))
with(q1Uabs, table(council,unexusedAbs >=10))
with(q1Uabs, table(council,unexusedAbs >=15))
with(q1Uabs, table(council,unexusedAbs >=20))
with(q1Uabs, table(council,unexusedAbs >=25))
with(q1Uabs, table(council,unexusedAbs >=30))




#######Excused Absences

q1Exabs <- gradesUnique[, c(7,8,12)]

head(q1Exabs)

summary(q1Exabs)

q1Exabs$excuseddAbs <- as.numeric(q1Exabs$excusedAbs) 

with(q1Exabs, table(excusedAbs))

with(q1Exabs, table(council, excusedAbs <=0))
with(q1Exabs, table(council, excusedAbs >=5))
with(q1Exabs, table(council, excusedAbs >=10))
with(q1Exabs, table(council, excusedAbs >=15))
with(q1Exabs, table(council, excusedAbs >=20))
with(q1Exabs, table(council, excusedAbs >=30))



with(q1Exabs, tapply(excusedAbs, council,summary))

#######Behavioral Referrals

q1Bev <- gradesUnique[, c(7,8,13)]



q1Bev$behaviorRef <-as.numeric(q1Bev$behaviorRef)

with(q1Bev, table(behaviorRef, council))

with(q1Bev, tapply(behaviorRef,council, summary))


####################In School Suspensions##############

q1Is <- gradesUnique[, c(7,8,14)]


q1Is$inSchoolSusp <- as.numeric(q1Is$inSchoolSusp)


with(q1Is, table(inSchoolSusp, council))

with(q1Is, tapply(inSchoolSusp, council, summary))

##################Out of School Suspensions#############3

q1Os <- gradesUnique[, c(7,8,15)]

q1Os$outofSchoolSusp <- as.numeric(q1Os$outofSchoolSusp)

with(q1Os, table(outofSchoolSusp))

with(q1Os, tapply(outofSchoolSusp, council, summary))

with(q1Os, table(outofSchoolSusp, council))


#################Expelled###########################

q1Exp <-gradesUnique[, c(7,8,16)]


with(q1Exp, table(expelled))

with(q1Exp, table(council, expelled))


############Free Lang###############3

q1freeLan <-gradesUnique[, c(7,8, 46,47 )]

q1freeLan

grep("eng", q1freeLan$freeLang2,ignore.case=TRUE)


gulfcoast <-filter(q1, council=="Girl Scouts of Gulfcoast Florida")

gulfcoast

outcomeGrades(merge())

############################Behavior Data###########################3


q1behavior <- gradesUnique [, c(8,7,11,12,13,14,15)]

saveRDS(q1behavior, file="q1behavior.rds")

