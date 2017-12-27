#Setting the path to directory

setwd("C:\\DataScience")

#creating a folder rawdata, if the folrder doesn't exist
if(!file.exists("Rawdata"))
{
  dir.create("Rawdata")
}

#downloading the file and unzipping it in the said directory
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile = "./Rawdata/Dataset.zip")
unzip(zipfile = "./Rawdata/Dataset.zip",exdir = "./Rawdata")

#Reading training data

x_train_Rawdata <- read.table("./Rawdata/UCI HAR Dataset/train/X_train.txt")
y_train_Rawdata <- read.table("./Rawdata/UCI HAR Dataset/train/y_train.txt")
subject_train_Rawdata <- read.table("./Rawdata/UCI HAR Dataset/train/subject_train.txt")

# Reading test data
x_test_Rawdata <- read.table("./Rawdata/UCI HAR Dataset/test/X_test.txt")
y_test_Rawdata <- read.table("./Rawdata/UCI HAR Dataset/test/y_test.txt")
subject_test_Rawdata <- read.table("./Rawdata/UCI HAR Dataset/test/subject_test.txt")

#Reading feature data
feature_data <- read.table("./Rawdata/UCI HAR Dataset/features.txt")

#Reading activity labels data
features_info <- read.table("./Rawdata/UCI HAR Dataset/activity_labels.txt")


#naming the columns of y_test data,y_subject data, y_train data,y_subject data and also features_info data
colnames(x_train_Rawdata) <- feature_data[,2] 
colnames(y_train_Rawdata) <-"activityid"
colnames(subject_train_Rawdata) <- "subjectid"

colnames(x_test_Rawdata) <- feature_data[,2] 
colnames(y_test_Rawdata) <- "activityid"
colnames(subject_test_Rawdata) <- "subjectid"

colnames(features_info) <- c('activityid','activitytype')

# 1.Merging the training and the test sets to create one data set.
#merging the data tables using rbind
x_merged <- rbind(x_train_Rawdata,x_test_Rawdata)
y_merged <- rbind(y_train_Rawdata,y_test_Rawdata)
subject_merged <- rbind(subject_train_Rawdata,subject_test_Rawdata)
#Finally creating one data table using c_bind
Final_data <- cbind(x_merged,y_merged, subject_merged)

# 2.Extracts only the measurements on the mean and standard deviation for each measurement.
#to retrieve all std and mean from feature data 

#col_names <- colnames(Final_data)
Mean_SD_ID <- (grepl("activityid|subjectid|mean.*|std.*", names(Final_data)))
mean_Sd_table <- Final_data[ , Mean_SD_ID ==TRUE]


# 3.Uses descriptive activity names to name the activities in the data set

Activity_Names <- merge(mean_Sd_table, features_info,
                              by='activityid',
                              all.x=TRUE)
# 4. Appropriately labels the data set with descriptive variable names.

#names(Activity_Names) <- tolower(names(Activity_Names))
names(Activity_Names) <- gsub("-","",names(Activity_Names))
names(Activity_Names) <- gsub("BodyBody","Body",names(Activity_Names))
names(Activity_Names) <- gsub("\\(\\)","",names(Activity_Names))

# 5.From the data set in step 4, creates a second, independent tidy data set with 
#the average of each variable for each activity and each subject.

TidyData <- aggregate(.~subjectid + activityid, Activity_Names, mean)
TidyData <- merge(TidyData, features_info,
                       by ='activityid',
                       all.x=TRUE)
names(TidyData) <- gsub("\\.)","",names(TidyData))

write.table(TidyData, "C:/Datascience/TidyData.txt", row.names = FALSE)



