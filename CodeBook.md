This code book describe the data and processing done to produce the FinalTidayData.txt

Data source
* Human Activity Recognition Using Smartphones
* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Extract the zip file into "UCI HAR Dataset" folder

Processing
* run_analysis.R perform the processing
* It loads the data in the "UCI HAR Dataset" folder. The columns are assgined from the features.txt file
* It select any columns with the name 'mean' or 'std' in it.
* It translate the activity values 1 - 6 into descriptive names defined in activity_labels.txt file
* It combined the Subject, Observation X, and Activity Label Y into a single table.
* It then combine the TRAIN and TEST data into one data table 'combined_data'
* It change the column names to be descriptive by substitution
* It then group the 'combined_data' by Subject and Activity
* It then calculates the mean of each variables
* It saves the data into FinalTidayData.txt