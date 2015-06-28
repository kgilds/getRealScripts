### Set Working Directory
setwd("C:/Users/kevin/Dropbox/GetReal/Data/April 2015")

#### Load the Libraries
library(dplyr)
library(reshape2)

####
gradesQ4 <-read.csv("q4Grades.csv", skip=1)



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
