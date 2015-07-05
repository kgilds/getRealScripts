
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
