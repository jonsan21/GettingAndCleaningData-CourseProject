# GettingAndCleaningData-CourseProject

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The repository contains:

1. This README.md file
2. CodeBook.md. A code book that describes the variables, the data, and any transformations or work that was performed to clean up the data. 
3. run_analysis.R. An R script that performs "getting and cleaning" data as described below.
4. tidydata.txt. An output file, as described below.

This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example  this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##What does the script (run_analysis.R) do

1. Merges the training and the test sets to create one data set.
2. Appropriately labels the data set with descriptive variable names. (This is task 4 in the assignment but done earlier for simplicity)
3. Extracts only the measurements on the mean and standard deviation for each measurement. (This is task 2 in the assignment)
4. Uses descriptive activity names to name the activities in the data set (This is task 3 in the assignment)
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

##The script, explained in details

First, we download and unzip the data.
```r
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destFile <- "dataset.zip"
download.file(fileUrl, destfile=destFile)
dateDownloaded <- date()
unzip(destFile)
```
Then we read the files into R, first the files in the root directory of the unzipped folder.
```r
#read features and activity labels
features <- read.table("./UCI HAR Dataset/features.txt")
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
```
Followed by the test data in the /test folder
```r
#read test data
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testLabels <- read.table("./UCI HAR Dataset/test/Y_test.txt")
```
And the train data in the /train folder
```r
#read train data
train <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
trainLabels <- read.table("./UCI HAR Dataset/train/Y_train.txt")
```
We then merge the training and the test sets to create one data set (TASK 1)
```r
merged <- rbind(train, test)
mergedSubject <- rbind(trainSubject, testSubject)
mergedLabels <- rbind(trainLabels, testLabels)
```
Continued by extracting only the measurements on the mean and standard deviation for each measurement. (TASK 2)

In this process we appropriately labels the data set with descriptive variable names. (TASK 4)
```r
names(merged) <- features$V2 #this is for task 4
mergedSubset <- merged[grepl("mean\\(|std\\(",names(merged))]
```
We then name the activities in the data set using descriptive activity names. (TASK 3)

We use the join function from the plyr package so that the order of the data is not changed.

We write this tidy data to tidydata.txt
```r
joinedLabels <- join(mergedLabels,activityLabels)
mergedSubset <- cbind(joinedLabels$V2,mergedSubset)
colnames(mergedSubset)[1] <- "activitylabels"
mergedSubset <- cbind(mergedSubject,mergedSubset)
colnames(mergedSubset)[1] <- "subject"
write.table(mergedSubset,"tidydata.txt",row.names = FALSE)
```
We can then create a second, independent tidy data set with the average of each variable for each activity and each subject. (TASK 5)

We use the summarise_each function with chaining from the dplyr package to do this in one line!

We write this tidy data to tidydata_mean.txt
```r
tidydata <- mergedSubset %>% group_by(activitylabels, subject) %>% summarise_each(funs(mean)) 
write.table(tidydata,"tidydata.txt",row.names = FALSE)
```
