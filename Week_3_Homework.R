?read.csv
surveys <- read.csv("data/portal_data_joined.csv")
nrow(surveys)
ncol(surveys)
dim(surveys)
?str
str(surveys)
surveys
class(surveys)
summary(surveys)
str(surveys)

head(surveys)
tail(surveys)
head(surveys,n = 3)

summary(object = surveys)
summary.data.frame(surveys)
?summary.data.frame

surveys[1,5]
head(surveys,1)

surveys[,1]
surveys[1,]

#install.packages('tidyverse')
#library(tidyverse)

##

surveys <- read.csv("data/portal_data_joined.csv")
colnames(surveys)
surveys_base <- surveys[1:5000, c(6, 9, 13)]
surveys_base <- surveys_base[complete.cases(surveys_base),] 
surveys_base$species_id <- factor(surveys_base$species_id) 
surveys_base$plot_type <- factor(surveys_base$plot_type) 
levels(surveys_base$species_id)
typeof(surveys_base$species_id)
class(surveys_base$species_id)
challenge_base <- surveys_base[surveys_base[,2]>150,]