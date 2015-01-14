# Description of variables and the process to obtain the results for this assignment.

A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

1. Merges the training and the test sets to create one data set.

Here I use read.table to read all .txt data files. Using rbind function we can join train set and test set. 

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

Using grep() function is possible to detect which columns contain a varaible about mean or standard deviation. 
We can also clean a little bit the description name avoiding parenthesis and minus signs. 

3. Uses descriptive activity names to name the activities in the data set

In order to use descriptive activity names I create a function called DescriptiveName.
It convert to lower case and split the words to get the first letter capitalize. 

4. Appropriately labels the data set with descriptive variable names. 

Just need to apply names to subjects and call write.table to obtain the  first output data_set.txt.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Taking advantage of doBy library, I use summaryBy function over the dataset applying . ~ subject + Activity 
that means a group by subject, activity. The function to apply is mean. 
Finally ".mean" at the end of the names in the dataset are cleaned and the data is written in the second output (data_set_means.txt)

