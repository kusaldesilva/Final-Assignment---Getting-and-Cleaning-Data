#load dplyr package
library(dplyr)

# Download file
fileURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, "files", method="curl")

# unzip file
unzip("files") 

#Getting data frames
Features = read.table("UCI HAR Dataset/features.txt", col.names = c("id","functions"))
ActivityLabel = read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("Code", "Activity"))
SubjectTest = read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
SubjectTrain = read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
xTest = read.table("UCI HAR Dataset/test/X_test.txt", col.names = Features$functions)
yTest = read.table("UCI HAR Dataset/test/y_test.txt", col.names = "Code")
xTrain = read.table("UCI HAR Dataset/train/X_train.txt", col.names = Features$functions)
yTrain = read.table("UCI HAR Dataset/train/y_train.txt", col.names = "Code")

#Assignment - data manipulation

#Merges the training and the test sets
combineX  =  rbind(xTrain, xTest)
combineY  =  rbind(yTest, yTrain)
CombineSubject  =  rbind(SubjectTest, SubjectTrain)

CombineDF  =  cbind(combineX, combineY, CombineSubject)

#Extracts the mean and standard deviation from each measurement
ManipData  =  CombineDF %>% 
  select(Subject, Code, contains("mean"), contains("std"))

# Change name of the activities in the data set
ManipData$Code  =  ActivityLabel[ManipData$Code, 2]

#Change column names
names(ManipData)[2] = "Activity"
names(ManipData) = gsub("Acc", "Accelerometer", names(ManipData))
names(ManipData) = gsub("Gyro", "Gyroscope", names(ManipData))
names(ManipData) = gsub("BodyBody", "Body", names(ManipData))
names(ManipData) = gsub("Mag", "Magnitude", names(ManipData))
names(ManipData) = gsub("^t", "Time", names(ManipData))
names(ManipData) = gsub("^f", "Frequency", names(ManipData))
names(ManipData) = gsub("tBody", "TimeBody", names(ManipData))
names(ManipData) = gsub("-mean()", "Mean", names(ManipData), ignore.case = TRUE)
names(ManipData) = gsub("-std()", "STD", names(ManipData), ignore.case = TRUE)
names(ManipData) = gsub("-freq()", "Frequency", names(ManipData), ignore.case = TRUE)
names(ManipData) = gsub("angle", "Angle", names(ManipData))
names(ManipData) = gsub("gravity", "Gravity", names(ManipData))


ManipulateDF = ManipData %>%
  group_by(Subject, Activity) %>%
  summarise_all(mean)

write.table(ManipulateDF, "ManipulateData.txt", row.name=FALSE)
