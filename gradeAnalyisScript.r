library(sqldf)
library(reshape2)
library(dplyr)
setwd("C:/Users/kevin/Dropbox/GetReal/Data/March 2015")
getRealdb<- dbConnect(SQLite(), dbname="tempGetReal.sqlite")

dbListTables(getRealdb)

###########################################Reading###################################################

reading <-dbReadTable(getRealdb, "reading")


##Select the Columns needed
readingA <-select(reading, girlCode, council, variable, value, readingCourses, readingGrade)

###Change Variable name to make better sense
colnames (reading) [3] <-"readingCoursesQ1"
colnames (reading) [4] <-"Q1grade"
colnames (reading) [7] <- "readingCoursesQ2"
colnames (reading) [8] <-"Q2grade"


#######Calculated field################

diff <- reading$Q2grade-reading$Q1grade

data.frame(diff)

##############Bind the data##################

readingFinal <-cbind(reading, diff)



#########################################Lang Arts##############################

langArts <-dbReadTable(getRealdb, "lang")

langArtsA <-select(langArts, girlCode, council, variable, value, langArtsCourses, langArtsGrade)

colnames (langArts) [3] <-"langArtsCoursesQ1"
colnames (langArts) [4] <- "Q1langgrade"
colnames (langArts) [7] <- "langArtsCoursesQ2"
colnames (langArts) [8] <-"Q2langgrade"


diffLang <-langArts$Q2langgrade-langArts$Q1langgrade

data.frame(diffLang)

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



