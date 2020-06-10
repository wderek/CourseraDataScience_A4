library(dplyr)


### Load files
###

features <- as_tibble(read.table("UCI HAR Dataset/features.txt", header = FALSE, sep = "", dec = "."))
activity_labels <- as_tibble(read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE, sep = "", dec = "."))

X_train <- as_tibble(read.table("UCI HAR Dataset/train/X_train.txt"))
Y_train <- as_tibble(read.table("UCI HAR Dataset/train/y_train.txt"))
Subject_train <- as_tibble(read.table("UCI HAR Dataset/train/subject_train.txt"))

X_test <- as_tibble(read.table("UCI HAR Dataset/test/X_test.txt"))
Y_test <- as_tibble(read.table("UCI HAR Dataset/test/y_test.txt"))
Subject_test <- as_tibble(read.table("UCI HAR Dataset/test/subject_test.txt"))

### Fix column names
###

names(X_train) <- t(features[,2])
names(X_test) <- t(features[,2])

### Fix column names
###

X_train <- select (X_train, contains("mean") | contains("std"))
X_test <- select (X_test, contains("mean") | contains("std"))