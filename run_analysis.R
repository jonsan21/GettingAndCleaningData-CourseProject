#load the required packages
library(plyr)
library(dplyr)

#download and unzip file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destFile <- "dataset.zip"
download.file(fileUrl, destfile=destFile)
dateDownloaded <- date()
unzip(destFile)

#read features and activity labels
features <- read.table("./UCI HAR Dataset/features.txt")
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

#read test data
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testLabels <- read.table("./UCI HAR Dataset/test/Y_test.txt")

#read train data
train <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
trainLabels <- read.table("./UCI HAR Dataset/train/Y_train.txt")

#TASK 1 - Merges the training and the test sets to create one data set.
merged <- rbind(train, test)
mergedSubject <- rbind(trainSubject, testSubject)
mergedLabels <- rbind(trainLabels, testLabels)

#TASK 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
names(merged) <- features$V2 #this is for task 4
mergedSubset <- merged[grepl("mean\\(|std\\(",names(merged))]

#TASK 3 - Uses descriptive activity names to name the activities in the data set
joinedLabels <- join(mergedLabels,activityLabels)
mergedSubset <- cbind(joinedLabels$V2,mergedSubset)
colnames(mergedSubset)[1] <- "activitylabels"
mergedSubset <- cbind(mergedSubject,mergedSubset)
colnames(mergedSubset)[1] <- "subject"
write.table(mergedSubset,"tidydata.txt",row.names = FALSE)

#TASK 4 - columns have been named in TASK2

#TASK 5 - creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidydata <- mergedSubset %>% group_by(activitylabels, subject) %>% summarise_each(funs(mean))
write.table(tidydata,"tidydata_mean.txt",row.names = FALSE)
