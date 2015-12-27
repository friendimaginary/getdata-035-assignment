# getdata-034-assignment

The purpose of this project is to demonstrate one's ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

The data used here was collected from the accelerometers from the Samsung Galaxy S smartphone, and may be obtained from the following URL:

[getdata-projectfiles-UCI HAR Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The script "run\_analysis.R" will function when its working directory is the same as the location containing the extracted .zip file "UCI HAR Dataset." As per the assignment, the script does the following:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The script reads in the following files from the Samsung dataset:
* activity\_lables.txt -- descriptive names of activities
* features.txt -- descriptive names of variables
* test/y\_test.txt -- activity IDs from test data
* train/y\_test.txt -- activity IDs from training data
* test/subject\_test.txt -- subject IDs from test data
* train/subject\_train.txt -- subject IDs from training data
* test/X\_test.txt -- the actual test data
* train/X\_test.txt -- the actual training data

Variable names from features.txt were applied as column names for the test and training dataframes. The subset of columns containing mean and standard deviation variables were extracted from each and combined in a new table. The subjects' test and training IDs were then reattached to the table, along with descriptive names for the activity IDs.

Finally, the resulting dataset was exported to a text file which may be used for further analysis.

The precise steps in this conversion may be found in the script run\_analysis.R, along with additional code snippets used in the exploration. The script is thoroughly commented.

