#setwd("~/Documents/Coursera/CleaningData")
# download and unzip files if needed
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "dataset.zip", method = "curl", mode='wb')
#unzip('./dataset.zip')
# reading files

# 1. Merges the training and the test sets to create one data set.
X.train <- read.table('./UCI HAR Dataset/train/X_train.txt')
Y.train <- read.table('./UCI HAR Dataset/train/y_train.txt')
subject.train <- read.table('./UCI HAR Dataset/train/subject_train.txt')
subject.test <- read.table('./UCI HAR Dataset/test/subject_test.txt')
X.test <- read.table('./UCI HAR Dataset/test/X_test.txt')
Y.test <- read.table('./UCI HAR Dataset/test/y_test.txt')
# joining train and test data
data <- rbind(X.train, X.test)
label <- rbind(Y.train, Y.test)
subject <- rbind(subject.train, subject.test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
measurement <- read.table('./UCI HAR Dataset/features.txt')
index <- grep("mean\\(\\)|std\\(\\)", measurement[,2])
data <- data[, index ]
names(data) <- gsub("\\(\\)", "", measurement[index, 2]) 
names(data) <- gsub("-", "", names(data)) 
names(data) <- gsub("mean", "Mean", names(data)) 
names(data) <- gsub("std", "Std", names(data)) 

# 3. Uses descriptive activity names to name the activities in the data set
activity <- read.table("./UCI HAR Dataset//activity_labels.txt")

DescriptiveName <- function(x) {
  x <- tolower(gsub("_"," ",x))
  s <- strsplit(x, " ")[[1]]
  paste(toupper(substring(s, 1,1)), substring(s, 2),
        sep="", collapse=" ")
}

activity[,2] <- sapply(activity[,2], DescriptiveName)
names(label) <- "Activity"
label[,1] <- activity[label[,1],2]

# 4. Appropriately labels the data set with descriptive variable names. 
names(subject) <- "subject"
dataset <- cbind(subject, data, label)

write.table(dataset, "data_set.txt" , row.names = FALSE) 

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(doBy)
subjects.activity.dataset <- summaryBy(. ~ subject + Activity, data=dataset, FUN=mean)
names(subjects.activity.dataset) <- gsub(".mean$","", names(subjects.activity.dataset))
write.table(subjects.activity.dataset, "data_set_means.txt" , row.names = FALSE) 
