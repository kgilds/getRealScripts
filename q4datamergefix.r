
#################Reading###################33
readq4<- readRDS("q4Reading.rds")
 readq4A <-readRDS("q4AReading.rds")
 
 q4ReadingFinal <- rbind(readq4, readq4A)
 
 q4ReadingFinal <-na.omit(q4ReadingFinal)
 dim(q4ReadingFinal)
 
#####################Save the final Data Frame###################3
 saveRDS(q4ReadingFinal, "q4ReadingFinal.rds")
 
 ######################Language Arts#############################
 langq4 <- readRDS("q4Lang.rds")
 langq4A <- readRDS("q4ALangArts.rds")
 
 q4LangArtsFinal <-rbind(langq4, langq4A)
 
 q4LangArtsFinal <-na.omit(q4LangArtsFinal)
 dim(q4LangArtsFinal)
 
#######################Save the data frame################3
 saveRDS(q4LangArtsFinal, "q4LangArtsFinal.rds")
 

#####################Unexcused Absences################33

q4Unexcused <- readRDS("q4UnexcusedAbsences.rds")

q4AUnexcused<- readRDS ("q4AUnexcusedAbsences.rds")

q4UnexcusedAbsFinal <- rbind(q4Unexcused, q4AUnexcused)

saveRDS(q4UnexcusedAbsFinal, "q4UnexecusedAbsFinal.rds")


####################Excused Absences########################3

##########Need to fix Q4ADatamanage

q4Excused <-readRDS("q4ExcusedAbsences.rds")

q4AExcused <- readRDS("q4AEAbs.rds")

q4ExcusedAbsFinal <- rbind(q4Excused, q4AExcused)

dim(q4ExcusedAbsFinal)

saveRDS(q4ExcusedAbsFinal, "q4ExcusedAbsFinal.rds")


#####################Out of School Suspensions

q4OutofSchool <- readRDS("Out of School Suspensions.rds")

dim(q4OutofSchool)

q4AOutofSchool <- readRDS("q4AOutofSchoolSuspensions.rds")

dim(q4AOutofSchool)


q4OutofSchoolFinal <- rbind(q4OutofSchool, q4AOutofSchool)

dim(q4OutofSchoolFinal)

saveRDS(q4OutofSchoolFinal, "q4OutOfSchoolSuspensions.rds")

#####In School Suspensions#####################3

q4InSchoolSuspensions <-readRDS("In School Suspensions.rds")

q4AInSchoolSuspensions <- readRDS("q4AInSchoolSuspensions.rds")

q4InSchoolSuspensionsFinal <- rbind(q4InSchoolSuspensions, q4AInSchoolSuspensions)

dim(q4InSchoolSuspensionsFinal)

saveRDS(q4InSchoolSuspensionsFinal, "q4InSchoolSuspensionsFinal.rds")


####################Behaviroal Referrals. 

q4BehaviorReferrals <-readRDS("q4Behavioral Referrals.rds")

q4ABehaviorReferrals <- readRDS("q4ABehaviorReferral.rds")

q4ReferralsFinal <- rbind(q4BehaviorReferrals, q4ABehaviorReferrals)

dim(q4ReferralsFinal)

saveRDS(q4ReferralsFinal, "q4Referrals.rds")


############Expelled#######

q4Expelled <- readRDS("q4Expelled.rds")

q4AExpelled <- readRDS("q4AExpelled.rds")


q4ExpelledFinal <- rbind(q4Expelled, q4AExpelled)

dim(q4ExpelledFinal)
saveRDS(q4ExpelledFinal, "q4ExpelledFinal.rds")
 
 