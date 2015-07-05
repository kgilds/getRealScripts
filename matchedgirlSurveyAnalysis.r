library(dplyr)
library(reshape2)



#### Read the files from girlSurvey Data Management, this will need to be updated. 
girlPre <- readRDS("girlPre07042015.rds")

girlPost <-readRDS("girlPost07042015.rds") #N=735



######### Fix Girl Code###############################################

######################Gateway#######################################
gateway <-filter(girlPost, council == "Gateway Council")


###Fix
girlCode2<- sub("313", "", gateway$girlCode)

fixgirlCode<- sub("", "313", girlCode2)

gateway$girlCode <- fixgirlCode


#####Test Girl Codes####################
gateway$girlCode

head(gateway$girlCode)

tail(gateway$girlCode)

head(gateway$girlCode, n=250)

############New Post Data frames################

dim(gateway)

str(gateway)


gatewayPost <- filter(gateway, Time == "Post")


GatewayprePost <- left_join(girlPost, girlPre, by = "girlCode", Copy=FALSE)


#########################Citrus############################################

citrus <- filter(girlPost, council == "Citrus Council")

girlCodeCitrus<- sub("312", "", citrus$girlCode)

fixgirlCodeCitrus<- sub("", "312", girlCodeCitrus)

citrus$girlCode <- fixgirlCodeCitrus


head(citrus$girlCode, n=100)


citrusPre <-filter(citrus, Time == "Pre")

citrusPost <-filter(citrus, Time == "Post")

dim(citrusPost)

citrusPre



#######################Panhandle

panhandle <-filter(girlPost, council == "Panhandle Council")


###Fix
girlCodePanhandle<- sub("322", "", panhandle$girlCode)

fixgirlCodePanhandle<- sub("", "322", girlCodePanhandle)

panhandle$girlCode <- fixgirlCodePanhandle


head(panhandle$girlCode, n=122)





######################Unmatched Girl Codes##############################

prePost_anti <-anti_join(girlPost,girlPre, by ="girlCode", Copy=FALSE)


######################### Exclude and add Gateway and Citrus back and Panhandle ############################

excludeGatewayCitrusPanhandle <-filter(girlPost, council != "Citrus Council" & council != "Gateway Council" & council != "Panhandle Council") #n=292

addGatewayGirlPost <- rbind(gateway, excludeGatewayCitrusPanhandle) #N=564

addedCitrusPost <-rbind(citrus, addGatewayGirlPost) #N=611

girlPost1 <- rbind(panhandle, addedCitrusPost) #N=735



#####Join df by girlCod using Dplyr library###################################################
prePost <- left_join(girlPost1, girlPre, by = "girlCode", Copy=FALSE)


prePost_anti <-anti_join(girlPost,girlPre, by ="girlCode", Copy=FALSE)




####################Pair down date frame into the Outcomes that we are interested in#########
hr <- select(prePost, Time.x, council.x, girlCode, hr.avg.x, hr.avg.y)


#########################Match the completed cases################################
hr1<-hr %>% filter(complete.cases(hr)) 


############################Calculate diff between post score and pre score##########
diffhr <- (hr1$hr.avg.x-hr1$hr.avg.y)

###################Bind to dataframe##########################################
hr1<-cbind(hr1, diffhr)


######################Basic Analsis T-tests############################################

hr2 <- select(hr1, Time.x, girlCode,hr.avg.x, hr.avg.y)

t.test(hr2$hr.avg.x, hr2$hr.avg.y, paired=TRUE)





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

############Bind ae_diff to ae1###########################3

ae2 <- cbind (ae1, ae_diff)

######################T-Tests###############################3
ae2 <- select(ae1, Time.x, girlCode,ae.avg.x, ae.avg.y)

t.test(ae2$ae.avg.x, ae2$ae.avg.y, paired=TRUE)


###################General Outcome Table####################3

ae_table_pre <-with(ae2,table(ae.avg.y >=4.5))

ae_table_post <-with(ae2,table(ae.avg.x >=4.5))


###########################################################


##########From not achieving to achieving####################

ae_not_a <- filter(ae2, ae.avg.y < 4.5)

ae_not_a_tbl <-with(ae_not_a,table(ae.avg.x >=4.5))

ae_not_a_tbl



#####Did not Achieve Academic Engagement post but increased score####

ae_not_achieved <-filter(ae2, ae.avg.y < 4.5)

ae_not_achieve_tbl <- with(ae_not_achieved,table(ae_diff >0))

ae_not_achieve_tbl

mean(ae_not_achieved$ae_diff)





####################Pair down date frame into the Outcomes that we are interested in#########
am <- select(prePost, Time.x, council.x, girlCode, am.avg.x, am.avg.y)


#########################Match the completed cases################################
am1<- am %>% filter(complete.cases(am)) 


############################Calculate diff between post score and pre score##########
diffam <- (am1$am.avg.x-am1$am.avg.y)

###################Bind to dataframe##########################################

am1<-cbind(am1, diffam)

##################T-tests###################################################3

am2 <- select(am1, Time.x, girlCode,am.avg.x, am.avg.y)

t.test(am2$am.avg.x, am2$am.avg.y, paired=TRUE)



##### General Outcome Tables###################################################

am.table.pre <- with(am1,table(am.avg.y >=4.8))

am.table.post <-with(am1,table(am.avg.x >=4.8))


###########From not achieving to achieving###################

am.not.a <-filter(am1, am.avg.y < 4.8)

am.table.not.pre <- with(am.not.a, table(am.avg.x>=4.8))

#####Did not Achieve post but increased score####

am.not.achieved <-filter(am1, am.avg.y <4.8)

am.not.achieve.tbl <- with(not_achieved,table(diffhr >0))

mean(am.not.achieved$diffam)


####Achieved Academic Post Outcome#####################

post.am.outcome <- filter(am1, am.avg.x >=4.8)



#####Means of Post Achieved#############
mean(post.am.outcome$am.avg.y)
mean(post.am.outcome$am.avg.x)
mean(post.am.outcome$diffam)

######Plots###############

boxplot(post.am.outcome$diffam)
dotchart(am1$diffam)
plot(post.am.outcome$diffam)
abline(h=0)


