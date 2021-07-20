#load dplyr package
library(dplyr)

# Download file
fileURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, "files", method="curl")

# unzip file
unzip("files") 

#Getting data frames
Features = read.table("UCI HAR Dataset/features.txt", col.names = c("functions"))
ActivityLabel = read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("Code", "Activity"))
SubjectTest = read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
SubjectTrain = read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
xTest = read.table("UCI HAR Dataset/test/X_test.txt", col.names = Features$functions)
yTest = read.table("UCI HAR Dataset/test/y_test.txt", col.names = "Code")
xTrain = read.table("UCI HAR Dataset/train/X_train.txt", col.names = Features$functions)
yTrain = read.table("UCI HAR Dataset/train/y_train.txt", col.names = "Code")

#Assignment - data manipulation

