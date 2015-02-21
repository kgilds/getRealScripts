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
