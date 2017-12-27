 About the file run_analysis.r

Below is the steps followed to clean the data prepare it for further R analysis

The data is taken from the below link.
 <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

The run_analysis.r file contains the code to clean the data for further analysis of the data.

The below steps are followed to clean the data.
*Initially downloaded the zip file to a local folder and unzipped it for further use.
*Merged all the test and train files to create one file.
*Extracted only the measurements on the mean and standard deviation for each measurement.
*Used descriptive activity names to name the activities in the data set.
*Appropriately labelled the data set with descriptive variable names.
*Using the above dataset, have created a tidy dataset with the average of each variable for each activity and each subject.

To run the script

I have set my working directory in the beginning of the file. Please set your working directory in the setwd command.

CodeBook.md contains all the variable names along with its description used in the run_analysis.r script.