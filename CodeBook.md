

## Human Activity Recognition Using Smartphones Data Set. 
A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## R Script
Download the dataset
Unzip the dataset
1. Merge the training and test datasets
1.1 Reading files
1.2 Assigning variable names
1.3 Merging all datasets into one set
2. Extracting only the measurements on the mean and sd for each measurement
2.1 Reading column names
2.2 Create vector for defining ID, mean, and sd
3. Use descriptive activity names
4. Appropriately labels the data set with descriptive variable names. (Done in previous steps.)
5. Creating a second,  independent tidy data set with the avg of each variable for each activity and subject

## Variables
x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files
features contains the correct names for the x_data dataset, which are applied to the column names stored in
