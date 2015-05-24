# The data source
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data here represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

# Data set information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

# Raw Data Sets
The raw data sets that are used to form the final dataset "tidy" are shown as following:

test/X_test.txt: Test set. 2947 rows and 561 columns of variables. Find the name of each variable in features.txt.

test/y_test.txt: Test labels. 2947 labels. The labels ranges is from 1 to 6.

train/X_train.txt: Training set. 7352 rows and 561 columns of vairables. Find the name of each variable in features.txt.

train/y_train.txt: Training labels. 7352 labels. The labels ranges is from 1 to 6.

features.txt: List of the column names of test and training data sets. There are 561 variables. 

activity_labels.txt: Links the class labels with their activity name.

train/subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

test/subject_test.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

# Transformation details
run_analysis.R does the following:
1.Merges the training and the test sets to create one data set.

2.Extracts only the measurements on the mean and standard deviation for each measurement. 

3.Uses descriptive activity names to name the activities in the data set

4.Appropriately labels the data set with descriptive variable names. 

5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

You may find more details of each step in the README.md

# About tidy.txt
There are total 180 rows and 81 columns.
The fist column is subjectID. The second is activity labels. And the rest are means or standard deviations of different features.
Each row shows the averages of different variables for a certain activity of a subject as following:

      subject activity_labels tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z

          1                1          0.2773308      -0.017383819        -0.1111481

          1                2          0.2554617      -0.023953149        -0.0973020

          1                3          0.2891883      -0.009918505        -0.1075662
