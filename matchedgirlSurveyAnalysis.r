
#### Read the files from girlSurvey Data Management, this will need to be updated. 
girlPre <- readRDS("girlPre067.rds")

girlPost <-readRDS("girlPost067.rds")

#####Join df by girlCod using Dplyr library
prePost <- left_join(girlPost, girlPre, by = "girlCode", Copy=FALSE)





####################Pair down date frame into the Outcomes that we are interested in#########
hr <- prePost1 <-select(prePost, Time.x, council.x, girlCode, hr.avg.x, hr.avg.y)


#########################Match the completed cases################################
hr1<-hr %>% filter(complete.cases(hr)) 


############################Calculate diff between post score and pre score##########
diffhr <- (hr1$hr.avg.x-hr1$hr.avg.y)

###################Bind to dataframe##########################################
hr1<-cbind(hr1, diffhr)


######################Basic Analsis############################################


##### General Outcome Tables###################################################

hr_table_pre <- with(hr1,table(hr.avg.y >=4.45))

hr_table_post <-with(hr1,table(hr.avg.x >=4.45))


###########From not achieving to achieving###################

hr_not_a <-filter(hr1, hr.avg.y < 4.45)

hr_table_not_pre <- with(hr_not_a, table(hr.avg.x>=4.45))

#####Did not Achieve hr post but increased score####

not_achieved <-filter(hr1, hr.avg.y <4.45)

not_achieve_tbl <- with(not_achieved,table(diffhr >0))

mean(not_achieved$diffhr)


####Achieved Hr Post Outcome#####################

post_hr_outcome <- filter(hr1, hr.avg.x >=4.45)



#####Means of Post Achieved#############
mean(post_hr_outcome$hr.avg.y)
mean(post_hr_outcome$hr.avg.x)
mean(post_hr_outcome$diffhr)

######Plots###############
boxplot(post_hr_outcome$diffhr)
plot(post_hr_outcome$diffhr)
abline(h=0)














