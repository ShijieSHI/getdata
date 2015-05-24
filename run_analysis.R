# Project: Getting and Cleaning Data 
setwd("~/Documents/Coursera/Data Science Specialization/3 Getting and Cleaning Data/03 practice/Project")

# 1 Merges the training and the test sets to create one data set

test <- read.table("./UCI HAR Dataset/test/X_test.txt")
train <- read.table("./UCI HAR Dataset/train/X_train.txt")
full <- rbind(test,train)


# 2 Extract only the measurements on the mean and standard deviation for each measurement.

# 2.1 Add variable names to the variables
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
names (full) <- features

# 2.2 Extract mean and std
extract_mean_std <- grep ("mean()|std()" , features)
full <- full[ , extract_mean_std ]


# 3 Uses descriptive activity names to name the activities in the dataset

# 3.1 Read and combine test/training labels
test_label <- read.table("./UCI HAR Dataset/test/y_test.txt")
train_label <- read.table("./UCI HAR Dataset/train/y_train.txt")
label <- rbind(test_label, train_label)

# 3.2 Read descriptive activity names, and match them to the relevant labels
activity_description <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
label[,2] = activity_description[label[,1]]
names(label) <- c("activity", "activity_description")


# 4 Appropriately labels the data set with descriptive variable names. 
full_with_label <- cbind(label,full)


# 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# 5.1 Add subjectID to the full_with_label dataset
test_sub <- read.table("./UCI HAR Dataset/test/subject_test.txt")
train_sub <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subjectID <- rbind ( test_sub , train_sub )
names(subjectID) <- "subjectID"
full_with_label_subjectID <- cbind ( subjectID, full_with_label )

#5.2 Creat the target dataset
library(reshape2)
melt <- melt(full_with_label_subjectID, id=c("subjectID", "activity"), measure.vars=colnames(full) )
full_tidy <- dcast(melt, subjectID+activity ~ variable , mean)


#6 Save the target tidy dataset
write.table(full_tidy, file="./tidy.txt", row.name=FALSE)