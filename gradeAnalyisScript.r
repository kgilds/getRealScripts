library(sqldf)
library(reshape2)
library(dplyr)
setwd("C:/Users/kevin/Dropbox/GetReal/Data/March 2015")
getRealdb<- dbConnect(SQLite(), dbname="tempGetReal.sqlite")

dbListTables(getRealdb)

###########################################Reading###################################################

reading <-dbReadTable(getRealdb, "reading")


##Select the Columns needed
readingA <-select(reading, girlCode, council, readingCoursesQ1, Q1grade, readingCoursesQ2, Q2grade)

##########The Assumption is that Q1 has more grades thus Q2 is listed first in the database#####################

colnames(readingA) [3] <- "Q2course"
colnames(readingA) [4] <- "Q2grade"
colnames(readingA) [5] <-"Q1course"
colnames(readingA) [6] <-"Q1grade"



#######Calculated field################

diff <- reading$Q2grade-reading$Q1grade



##############Bind the data##################

readingFinal <-cbind(readingA, diff)



#########################################Lang Arts##############################

langArts <-dbReadTable(getRealdb, "lang")

langArtsA <-select(langArts, girlCode, council, langArtsCoursesQ1, Q1langgrade, langArtsCoursesQ2, Q2langgrade)

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

colnames(UnexabsA) [3] <-"Q1unexusedAbs"
colnames(UnexabsA) [4] <-"Q2unexusedAbs"


diffUnexcu <- UnexabsA$Q2unexusedAbs-UnexabsA$Q1unexusedAbs
    
    
unexcusedFinal <-cbind(UnexabsA, diffUnexcu)
    

###############Excused Absences###########################3

excusedAbs <-dbReadTable(getRealdb, "excused")

excusedAbsA <-select(excusedAbs, council, girlCode, excusedAbs, excusedAbs.1)

colnames (excusedAbsA) [3] <- "Q1excusedAbs"
colnames (excusedAbsA) [4] <- "Q2excusedAbs"

diffExcu <- excusedAbsA$Q2excusedAbs-excusedAbsA$Q1excusedAbs

excusedAbsFinal <-cbind(excusedAbsA, diffExcu)


#######################In School #########################3

inSchool <-dbReadTable(getRealdb, "inSchool")

inSchoolA <-select(inSchool, council, girlCode, inSchoolSusp, inSchoolSusp.1)

colnames (inSchoolA) [3] <-"Q1inSchoolSusp"
colnames (inSchoolA) [4] <-"Q2inSchoolSusp"

diffInSchool <- inSchoolA$Q2inSchoolSusp-inSchoolA$Q1inSchoolSusp

inSchoolFinal <- cbind(inSchoolA, diffInSchool)


##################Out of School##############################

outofSchool <- dbReadTable(getRealdb, "OutofSchool")

outOfSchoolA <-select(outofSchool, council, girlCode, outofSchoolSusp, outofSchoolSusp.1 )

colnames (outOfSchoolA) [3] <-"Q1OutOfSchool"
colnames (outOfSchoolA) [4] <-"Q2OutOfSchool"

diffOutOfSchool <- outOfSchoolA$Q2OutOfSchool-outOfSchoolA$Q1OutOfSchool

data.frame(diffOutOfSchool)

outOfSchoolFinal <-cbind(outOfSchoolA, diffOutOfSchool)


#####################Behavior###############################33

behavior <-dbReadTable(getRealdb, "bevRef")

behaviorA <-select(behavior, council, girlCode, behaviorRef, behaviorRef.1)

colnames (behaviorA) [3] <- "Q1BehaviorRef"
colnames (behaviorA) [4] <- "Q2BehaviorRef"

diffBevRef <- behaviorA$Q2BehaviorRef - behaviorA$Q1BehaviorRef

behaviorRefFinal <- cbind(behaviorA, diffBevRef)

behaviorRefFinal



