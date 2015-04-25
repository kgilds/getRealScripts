#### Load the Libraries
library(dplyr)
library(reshape2)


###Read the data frame
gradesQ3 <- read.csv("Q3grades0424.csv", skip=1)



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





