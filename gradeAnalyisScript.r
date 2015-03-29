library(sqldf)
library(reshape2)
library(dplyr)
setwd("C:/Users/kevin/Dropbox/GetReal/Data/April 2015")
getRealdb<- dbConnect(SQLite(), dbname="getRealApril.sqlite")

dbListTables(getRealdb)

###########################################Reading###################################################

reading <-dbReadTable(getRealdb, "reading")


##Select the Columns needed
readingA <-select(reading, girlCode, council, variable, value, readingCourses, readingGrade)

##########The Assumption is that Q1 has more grades thus Q2 is listed first in the database#####################

colnames(readingA) [3] <- "Q2course"
colnames(readingA) [4] <- "Q2grade"
colnames(readingA) [5] <-"Q1course"
colnames(readingA) [6] <-"Q1grade"



#######Calculated field################

diff <- readingA$Q2grade-readingA$Q1grade



##############Bind the data##################

readingFinal <-cbind(readingA, diff)



#########################################Lang Arts##############################

langArts <-dbReadTable(getRealdb, "lang")

langArtsA <-select(langArts, girlCode, council, variable, value, langArtsCourses, langArtsGrade)

colnames (langArtsA) [3] <-"langArtsCoursesQ2"
colnames (langArtsA) [4] <- "Q2langgrade"
colnames (langArtsA) [5] <- "langArtsCoursesQ1"
colnames (langArtsA) [6] <-"Q1langgrade"


diffLang <-langArtsA$Q2langgrade-langArtsA$Q1langgrade



#######################Bind#####################################3

langArtsFinal <-cbind(langArtsA,diffLang)


#########################Unexcused Absences###########################

Unexabs <- dbReadTable(getRealdb,"unexcused")

UnexabsA <-select(Unexabs, council, girlCode, unexusedAbs, unexusedAbs.1)

colnames(UnexabsA) [3] <-"Q2unexusedAbs"
colnames(UnexabsA) [4] <-"Q1unexusedAbs"


diffUnexcu <- UnexabsA$Q2unexusedAbs-UnexabsA$Q1unexusedAbs
    
    
unexcusedFinal <-cbind(UnexabsA, diffUnexcu)


saveRDS(unexcusedFinal, file="unexcused.rds")

###############Excused Absences###########################3

excusedAbs <-dbReadTable(getRealdb, "excused")

excusedAbsA <-select(excusedAbs, council, girlCode, excusedAbs, excusedAbs.1)

colnames (excusedAbsA) [3] <- "Q2excusedAbs"
colnames (excusedAbsA) [4] <- "Q1excusedAbs"

diffExcu <- excusedAbsA$Q2excusedAbs-excusedAbsA$Q1excusedAbs

excusedFinal <-cbind(excusedAbsA, diffExcu)

saveRDS(excusedFinal, file="excused.rds")

#######################In School #########################3

inSchool <-dbReadTable(getRealdb, "inSchool")

inSchoolA <-select(inSchool, council, girlCode, inSchoolSusp, inSchoolSusp.1)

colnames (inSchoolA) [3] <-"Q2inSchoolSusp"
colnames (inSchoolA) [4] <-"Q1inSchoolSusp"

diffInSchool <- inSchoolA$Q2inSchoolSusp-inSchoolA$Q1inSchoolSusp

inSchoolFinal <- cbind(inSchoolA, diffInSchool)

saveRDS(inSchoolFinal, file="inSchool.rds")

##################Out of School##############################

outofSchool <- dbReadTable(getRealdb, "outSchool")

outOfSchoolA <-select(outofSchool, council, girlCode, outofSchoolSusp, outofSchoolSusp.1 )

colnames (outOfSchoolA) [3] <-"Q2OutOfSchool"
colnames (outOfSchoolA) [4] <-"Q1OutOfSchool"

diffOutOfSchool <- outOfSchoolA$Q2OutOfSchool-outOfSchoolA$Q1OutOfSchool

data.frame(diffOutOfSchool)

outSchoolFinal <-cbind(outOfSchoolA, diffOutOfSchool)

saveRDS (outSchoolFinal, file= "outSchool.rds")


#####################Behavior###############################33

behavior <-dbReadTable(getRealdb, "bevRef")

behaviorA <-select(behavior, council, girlCode, behaviorRef, behaviorRef.1)

colnames (behaviorA) [3] <- "Q2BehaviorRef"
colnames (behaviorA) [4] <- "Q1BehaviorRef"

diffBevRef <- behaviorA$Q2BehaviorRef - behaviorA$Q1BehaviorRef

bevRefFinal <- cbind(behaviorA, diffBevRef)

bevRefFinal

saveRDS (bevRefFinal, file="bevRef.rds")




