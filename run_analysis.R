# Download the dataset
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
install.packages(fileurl, destfile = "UCIHARDataset.zip")
ucihar <- read.csv("UCIHARDataset.zip")

# Unzip the dataset
unzip("UCIHARDataset.zip")

# 1 Merge the training and test datasets
# 1.1 Reading files
x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")
x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")
features <- read.table("features.txt")
activitylabels <- read.table("activity_labels.txt")

# 1.2 Assigning variable names
colnames(x_train) <- features[,2]
colnames(y_train) <- "activityID"
colnames(subject_train) <- "subjectID"
colnames(x_test) <- features[,2]
colnames(y_test) <- "activityID"
colnames(subject_test) <- "subjectID"
colnames(activitylabels) <- c("activityID", "activityType")

# 1.3 Merging all datasets into one set
train <- cbind(y_train, subject_train, x_train)
test <- cbind(y_test, subject_test, x_test)
finaldataset <- rbind(train, test)

# 2. Extracting only the measurements on the mean and sd for each measurement
# 2.1 Reading column names
colnames <- colnames(finaldataset)

# 2.2 Create vector for defining ID, mean, and sd
meansd <- (grep("activityID", colnames) | 
           grep("subjectID", colnames) |
           grep("mean..", colnames) |
           grep("std...", colnames))
meansddataset <- finaldataset[ , meansd == TRUE]
           
# 3. Use descriptive activity names
activitynamesdataset <- merge(meansddataset, activitylabels,
                              by = "activityID",
                              all.x = TRUE)
           
# 5. Creating a second, independent tidy data set with the average of each 
# variable for each activity and subject
tidySet <- aggregate(. ~subjectID + activityID, activitynamesdataset, mean)
tidySet <- tidySet[order(tidySet$subjectID, tidySet$activityID), ]
write.table(tidySet, "tidySet.txt", row.names = FALSE)