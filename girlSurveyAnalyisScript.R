####Outcome Achievment###########################

load("preUnique")

names(preUnique)


save(preUnique, file="preUnique")

class(preUnique)

### Make data frame small with dplyr


outcomes <- select(preUnique, inProgramLastYear, council, girlCode, hr.avg, am.avg, ae.avg )

####In Program Last Year
table(outcomes$inProgramLastYear, outcomes$council)



#healthyrelationships

##mean averages across council

with(outcomes, tapply(hr.avg, council, mean))

with(outcomes, tapply(hr.avg, council, sd))

with(outcomes, tapply(hr.avg, council, summary))

###By Council

hr.council<- table(outcomes$hr.avg >=4.45, outcomes$council)

hr.council

hr.council <-as.data.frame(hr.council)

colnames (hr.council) [1] <- "Outcome Achievement"
colnames (hr.council) [2] <- "Girl Scout Council"
hr.council <-xtable(hr.council)

print(hr.council, type='html')


hr.counciltest <- dcast(hr.council, Girl Scout Council + Outcome Achievement ~ Freq)

aqw <- dcast(aql, month + day ~ variable)

barplot(hr.council, beside=TRUE, col=c("blue", "red"), legend=colnames))


###In Program last year
table(outcomes$hr.avg >=4.45, outcomes$inProgramLastYear)



####academic mastery

with(outcomes, tapply(am.avg, council, summary))

with(outcomes, tapply(am.avg, council, sd))

####by council

table(outcomes$am.avg >=4.8, outcomes$council)

### by inProgram Last Year
table(outcomes$am.avg >=4.8, outcomes$inProgramLastYear)


#####academic engagement

with(outcomes,(tapply(ae.avg, council, summary)))

with(outcomes,(tapply(ae.avg, council, sd)))

#############by council

table(outcomes$ae.avg >=4.5, outcomes$council)


######by inProgramLastYear

table(outcomes$ae.avg >=4.5, outcomes$inProgramLastYear)




##########################Correlations

outcomesCor <- select(hr.avg, am.avg., ae.avg)