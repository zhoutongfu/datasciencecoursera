setwd("~/Desktop/coursera/getting and cleaning data/course project/UCI HAR Dataset")

#### step1: read data and merge train and test sets
# read subject_train.txt, X_train.txt, y_train.txt
subjectTrain <- read.table(file = "train/subject_train.txt")
yTrain <- read.table(file = "train/y_train.txt")
xTrain <- read.table(file = "train/X_train.txt")
dim(yTrain) # 7352 obs.
dim(subjectTrain) # 7352 obs.
dim(xTrain) # 7352 obs.,  561 features
str(xTrain) # numeric
summary(xTrain)

# read subject_test.txt, X_test.txt, y_test.txt
subjectTest <- read.table(file = "test/subject_test.txt")
yTest <- read.table(file = "test/y_test.txt")
xTest <- read.table(file = "test/X_test.txt")
dim(yTest) # 2947 obs.
dim(subjectTest) # 2947 obs.
dim(xTest) #  2947 obs.,  561 features
str(xTest) # numeric
summary(xTest)

# merge train and test data sets
train <- cbind(xTrain,yTrain,subjectTrain)
dim(train) # 7352 obs.,  561 features , 1 activity, 1 subject
test <- cbind(xTest,yTest,subjectTest)
dim(test) # 2947 obs.,  561 features , 1 activity, 1 subject

data = rbind(train,test)
dim(data) # 7352+2947=10299 obs.,   563 cols
# read names for activity
activityName <- read.table(file = "activity_labels.txt",stringsAsFactors=FALSE)$V2




#### step2: label the data set with descriptive variable names. (I change the order of the steps here)
# read features.txt
features <- read.table(file="features.txt",stringsAsFactors=FALSE)$V2 # select feature names
str(features) # 561 strings

# assign feature names for the merged data
names(data) = c(features,"activity","subject")
head(data,5)




#### step3: extract measurements on mean and std
# find measurements on mean and std
library(stringr) # re
measurements <- sort(c(grep("mean\\(\\)", features, value = TRUE),grep("std\\(\\)", features, value = TRUE)))
length(measurements) # 66
dataSelected <- data[,measurements]

# bind activity and subject
dataSelected$activity <- data$activity
dataSelected$subject <- data$subject
dim(dataSelected) #10299    68
head(dataSelected,5)




#### step4: name activities with descriptive names
library(plyr)
# repalce activity value with descriptive activity names
dataSelected$activity <- as.factor(dataSelected$activity)

# use mapvalues from package "plyr" to map activity names -> activity values
dataSelected$activity <- mapvalues(dataSelected$activity,as.factor(seq(1,6,by=1)),activityName)




#### step5: creates a second, independent tidy data set with the average of each variable for each activity and each subject
library(dplyr)
# idea, group by subjects and activity using dplyr
dataTidy <- (dataSelected %>%
            group_by(subject,activity) %>% # group by subject and activity
            summarise_each(funs(mean)) %>% # apply mean to each column
            arrange(subject,activity) # order by subject, followed by activity
            )
dim(dataTidy) # 180, 68
setwd("~/Desktop/coursera/getting and cleaning data/course project/datasciencecoursera")
write.table(dataTidy,file="tidy_data.txt",row.names=FALSE,col.names=FALSE,sep="\t",quote=FALSE)
featuresTidy <- data.frame(names(dataTidy))
write.table(featuresTidy,file="features.txt",row.names=FALSE,col.names=FALSE,sep="\t",quote=FALSE)
# check if data is correctly recorded
newData <- read.table("tidy_data.txt")
newFeatures <- read.table("features.txt")
