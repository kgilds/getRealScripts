###############################Subset Pre Outcome Questions#################

outcomeTables <- preUnique[, c(17:47)] 


summary(outcomeTables)

table(preUnique$"iamMotivatedToGraduateHighSchool")

prop.table(preUnique$"iamMotivatedToGraduateHighSchool")