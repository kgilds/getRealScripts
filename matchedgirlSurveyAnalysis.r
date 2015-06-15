library(dplyr)
library(reshape2)



#### Read the files from girlSurvey Data Management, this will need to be updated. 
girlPre <- readRDS("girlPre067.rds")

girlPost <-readRDS("girlPost067.rds")

#####Join df by girlCod using Dplyr library
prePost <- left_join(girlPost, girlPre, by = "girlCode", Copy=FALSE)





####################Pair down date frame into the Outcomes that we are interested in#########
hr <- select(prePost, Time.x, council.x, girlCode, hr.avg.x, hr.avg.y)


#########################Match the completed cases################################
hr1<-hr %>% filter(complete.cases(hr)) 


############################Calculate diff between post score and pre score##########
diffhr <- (hr1$hr.avg.x-hr1$hr.avg.y)

###################Bind to dataframe##########################################
hr1<-cbind(hr1, diffhr)


######################Basic Analsis############################################

hr2 <- select(hr1, Time.x, girlCode,hr.avg.x, hr.avg.y)

hr3_melt <-melt(hr2, id.var=c("girlCode", "Time.x") ,measure.vars=c("hr.avg.x", "hr.avg.y"))


hr3_melt <-levels(hr2_melt$Time.x)

t.test(value~Time.x, data=hr2_melt, paired=TRUE)




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


############################Academic Engagement##########################333
ae <- select(prePost, Time.x, council.x, girlCode,ae.avg.x, ae.avg.y )



ae1<-ae %>% filter(complete.cases(ae)) 



#############Find the difference

ae_diff <- (ae1$ae.avg.x- ae1$ae.avg.y)

############Bind ae_diff to ae1
ae2 <- cbind (ae1, ae_diff)


###################General Outcome Table####################3

ae_table_pre <-with(ae2,table(ae.avg.y >=4.5))

ae_table_post <-with(ae2,table(ae.avg.x >=4.5))


###########################################################


##########From not achieving to achieving####################

ae_not_a <- filter(ae2, ae.avg.y < 4.5)

ae_not_a_tbl <-with(ae_not_a,table(ae.avg.x >=4.5))

ae_not_a_tbl



#####Did not Achieve hr post but increased score####

ae_not_achieved <-filter(ae2, ae.avg.y < 4.5)

ae_not_achieve_tbl <- with(ae_not_achieved,table(ae_diff >0))

ae_not_achieve_tbl

mean(ae_not_achieved$ae_diff)





