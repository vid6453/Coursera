This CodeBook contains all the variables used in the run_analysis.r script.

Below are the variables used in the script along with its description.

x_train_Rawdata - X_train.txt file loaded into R 
 y_train_Rawdata - y_train.txt file loaded into R
 subject_train_Rawdata - subject_train.txt file loaded into R

 x_test_Rawdata - X_test.txt file data loaded into R
 y_test_Rawdata - y_test.txt data loaded into R
 subject_test_Rawdata - subject_test.txt file loaded into R

 feature_data - features.txt file loaded into R
features_info - features_info.txt file loaded into R

Merges the training and the test sets to create one data set.

 x_merged - x_test and x_train data binded
y_merged - y_train and y_test binded
 subject_merged - subject_test and subject_train data merged

Final_data - final one data table after merging all the data

 Extracts only the measurements on the mean and standard deviation for each measurement.

 Mean_SD_ID - greped data only related to mean and standard deviation from the Final_data table along with column subjectid and activityid.
 mean_Sd_table - table with all mean and Standard deviation with subjectid and activityid columns.

 Uses descriptive activity names to name the activities in the data set.

Activity_Names - Table replaced with activity names merging with table features_info.

From the data set, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

TidyData - tidy data after finding the average of each variable


