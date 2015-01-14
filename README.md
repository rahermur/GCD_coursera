# GCD_coursera
Getting Cleaning Data

First you have to donwload and unzip the data using the following commands (commeted in run_analysis.R). 
I have not uploaded the files not to overload such large files on github.
Set the working directory propertly according with your preferences. 

setwd("~/Documents/Coursera/CleaningData")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "dataset.zip", method = "curl", mode='wb')
unzip('./dataset.zip')

Use source("run_analysis.R") command in RStudio.

It will generate two plain text files in the working directory. The same provided in the first part of the assignment. 

* data_set.txt      : 7.9 MB contains 180 samples and 68 variables.
* data_set_mean.txt : 218.7 KB contains 10299 samples and 68 variables. 

More information about variables in code book. 
