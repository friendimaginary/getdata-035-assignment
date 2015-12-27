## Course Assigment Work Space
##
library(data.table)
library(plyr)
library(dplyr)
##
## NOTE:  This script contains some interactive commands used in exploration of
## the raw dataset. These may illuminate the programmer's thought process, but
## do not impact the final results.

#### INSTRUCTION:
####
#### You should create one R script called run_analysis.R that does the 
#### following.
#### 
#### 1. Merges the training and the test sets to create one data set. 
#### 2. Extracts only the measurements on the mean and standard deviation for each
####    measurement.
#### 3. Uses descriptive activity names to name the activities in the data set
#### 4. Appropriately labels the data set with descriptive variable names. 
#### 5. From the data set in step 4, creates a second, independent tidy data set 
####    with the average of each variable for each activity and each subject.

activityLabels <- fread("UCI HAR Dataset/activity_labels.txt")
activityLabels

## these are the Descriptive names of the various activities used in the data

testLabels <- read.table("UCI HAR Dataset/test/y_test.txt")
testLabels
trainLabels <- read.table("UCI HAR Dataset/train/y_train.txt")
head(trainLabels)
str(trainLabels)

## these are the integers that represent the factors for the activities in the
## data. they will need to be replaced with the descriptive names in
## 'activityLabels' above

read.table("UCI HAR Dataset/test/X_test.txt", nrows = 10)
str(read.table("UCI HAR Dataset/test/X_test.txt", nrows = 10))
names(read.table("UCI HAR Dataset/test/X_test.txt", nrows = 2))
str(activityLabels)
features <- read.table("UCI HAR Dataset/features.txt")
str(features)
features[,2]

## that was mostly exploration, figuring out what we're reading in and how to
## lable it. 'features' contains the descriptions of the variables; i.e. column
## names.

testData <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features[,2],nrows = 10)
names(testData)
## that was a test with only 10 rows read in. it worked. SO:

testData <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features[,2] )
trainData <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features[,2] )

## now, lets try to extract the names containing SD and mean.

?names
?grep
grep("mean", features[,2], fixed = T)
grep("std" , features[,2], fixed = T)
sort( c( grep("mean()",features[,2], fixed = T) , grep("mean()",features[,2], fixed = T) ) )

## and that's our column subset

desiredColumns <- sort( c( grep('mean()',features[,2], fixed = T) , grep('mean()',features[,2], fixed = T) ) )
length(desiredColumns)
## Now, we'll pull those columns from testData and trainData, and rbind them together.

?rbind
totalData <- rbind( testData[ , desiredColumns] , trainData[ , desiredColumns] )
colnames(totalData)

## now we have to assemble the activity labels

totalLabels <- c(testLabels[,1],trainLabels[,1])
activity <- factor(totalLabels, labels = activityLabels$V2)

## and now to apply the labels to the data:

labeledData <- cbind( activity, totalData)
names(labeledData)
labeledData[1:10,1]

