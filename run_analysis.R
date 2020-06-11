library(dplyr)


### Load files
###

features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("ActivityID", "Activity"))

X_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = t(features[,2]))
Y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = c("Activity"))
Subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = c("Subject"))

X_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = t(features[,2]))
Y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = c("Activity"))
Subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = c("Subject"))

### Select columns with mean/std
###

X_train <- select (X_train, contains("mean") | contains("std"))
X_test <- select (X_test, contains("mean") | contains("std"))

### Set descriptive activity names
###

Y_train$Activity <- factor(Y_train$Activity, levels = activity_labels$ActivityID, labels = activity_labels$Activity)
Y_test$Activity <- factor(Y_test$Activity, levels = activity_labels$ActivityID, labels = activity_labels$Activity)

### Combine the data-frames into one 
###
data_train <- cbind(X_train,Subject_train,Y_train)
data_test <- cbind(X_test,Subject_test,Y_test)
combined_data <- rbind(data_train, data_test)

### Give Descriptive Variable Names
names(combined_data) <- gsub(".mean..", "Mean", names(combined_data))
names(combined_data) <- gsub(".std..", "Std", names(combined_data))

### Create tidy dataset with average of each variable for each activity and each subject
###

combined_data <- group_by(combined_data, Subject, Activity)
tidy_data <- summarise_each(combined_data, funs(mean))
write.table(tidy_data, "FinalTidyData.txt", row.name=FALSE)
