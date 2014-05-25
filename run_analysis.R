#load necessary libraries
library(data.table)

#clear all variables
rm(list=ls())

zip_file = "HAR_dataset.zip"
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", zip_file)
unzip(zip_file)
# file names and paths
f_features <- "./UCI HAR Dataset/features.txt"
f_activity <- "./UCI HAR Dataset/activity_labels.txt"

f_test_x_name <- "./UCI HAR Dataset/test/X_test.txt"
f_test_y_name <- "./UCI HAR Dataset/test/y_test.txt"
f_test_subj <- "./UCI HAR Dataset/test/subject_test.txt"

f_train_x_name <- "./UCI HAR Dataset/train/X_train.txt"
f_train_y_name <- "./UCI HAR Dataset/train/y_train.txt"
f_train_subj <- "./UCI HAR Dataset/train/subject_train.txt"

f_tidy_data <- "tidy_data.txt"

#load test data
x_t <- read.table(f_test_x_name)
y_t <- read.table(f_test_y_name)
subj_t <- read.table(f_test_subj)

#load train data
x_r <- read.table(f_train_x_name)
y_r <- read.table(f_train_y_name)
subj_r <- read.table(f_train_subj)

#bind test and train data
x <- rbind(x_t, x_r)
y <- rbind(y_t, y_r)
subj <- rbind(subj_t, subj_r)

#load features and activites
features <- read.table(f_features)
activity <- read.table(f_activity)

#get only features that have mean() or std() in the name
g_mean <- grep("mean()",features[,2], fixed=T)
g_std <- grep("std()",features[,2], fixed=T)
g_mean_std <- c(g_mean , g_std)
x_std_mean <- x[,g_mean_std]

#join y with activity 
y_activity <- merge(y, activity)[,2]

#add subject column and activity name column
x_act_subj <- cbind(subj, y_activity, x_std_mean)

# assign column names
col_names <- as.character(features[g_mean_std,2])
col_names <- c("Subject", "Activity", col_names)

#convert to data table
x_act_subj_dt <- data.table(x_act_subj)

#set column name
setnames(x_act_subj_dt,col_names)

#calculate mean,  group by Subject, Activity
avgDT <- x_act_subj_dt[, lapply(.SD,mean), by=c("Subject","Activity")]

#save tidy data to CSV file
write.table(avgDT, file=f_tidy_data, sep=",", row.names=FALSE)
