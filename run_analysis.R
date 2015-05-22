setwd("~/Desktop/coursera/getting and cleaning data/course project/UCI HAR Dataset")


# read features.txt, extract only mean and std
features <- read.table(file="features.txt",stringsAsFactors=FALSE)$V2 # select feature names
str(features)
length(features)
View(features)
library(stringr)
measurements <- sort(c(grep("mean\\(\\)", features, value = FALSE),grep("std\\(\\)", features, value = FALSE)))
features[measurements]


subjectTest <- read.table(file = "test/subject_test.txt")
activityTest <- read.table(file = "test/y_test.txt")

dim(subjectTest)
dim(activityTest)
