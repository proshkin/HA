install.packages("data.table")
library(data.table)

setwd("./Coursera/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")
f_features <- "features.txt"
f_activity <- "activity_labels.txt"
f_test_x_name <- "./test/X_test.txt"
f_test_y_name <- "./test/y_test.txt"
f_test_subj <- "./test/subject_test.txt"

f_train_x_name <- "./train/X_train.txt"
f_train_y_name <- "./train/y_train.txt"
f_train_subj <- "./train/subject_train.txt"

#f_test_x <- read.csv(f_test_x_name, sep=" ")
w <- rep(16, 561)
y_t<- f_test_y
x_t <- read.fwf(f_test_x_name, widths=w, buffersize=100)
y_t <- read.fwf(f_test_y_name, widths=c(1))
subj <- read.csv(f_test_subj, sep=" ", header=FALSE, stringsAsFactors=FALSE)

x_r <- read.fwf(f_train_x_name, widths=w, buffersize=100)
y_r <- read.fwf(f_train_y_name, widths=c(1))
subj_r <- read.csv(f_train_subj, sep=" ", header=FALSE, stringsAsFactors=FALSE)


features <- read.csv(f_features, sep=" ", header=FALSE, stringsAsFactors=FALSE)
activity <- read.csv(f_activity, sep=" ", header=FALSE, stringsAsFactors=FALSE)
pmatch(features[,2],c("mean","std"))
pmatch("bc", "abcd")
g_mean <- grep("mean()",features[,2], fixed=T)
g_std <- grep("std()",features[,2], fixed=T)
g_mean_std <- c(g_mean , g_std)
col_names <- install.packages("data.table")
library(data.table)

setwd("./Coursera/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")
f_features <- "features.txt"
f_activity <- "activity_labels.txt"
f_test_x_name <- "./test/X_test.txt"
f_test_y_name <- "./test/y_test.txt"
f_test_subj <- "./test/subject_test.txt"

f_train_x_name <- "./train/X_train.txt"
f_train_y_name <- "./train/y_train.txt"
f_train_subj <- "./train/subject_train.txt"

#f_test_x <- read.csv(f_test_x_name, sep=" ")
w <- rep(16, 561)
y_t<- f_test_y
x_t <- read.fwf(f_test_x_name, widths=w, buffersize=100)
y_t <- read.fwf(f_test_y_name, widths=c(1))
subj <- read.csv(f_test_subj, sep=" ", header=FALSE, stringsAsFactors=FALSE)

x_r <- read.fwf(f_train_x_name, widths=w, buffersize=100)
y_r <- read.fwf(f_train_y_name, widths=c(1))
subj_r <- read.csv(f_train_subj, sep=" ", header=FALSE, stringsAsFactors=FALSE)

x_t <- rbind(x_t, x_r)
y_t <- rbind(y_t, y_r)
subj <- rbind(subj, subj_r)



features <- read.csv(f_features, sep=" ", header=FALSE, stringsAsFactors=FALSE)
activity <- read.csv(f_activity, sep=" ", header=FALSE, stringsAsFactors=FALSE)
pmatch(features[,2],c("mean","std"))
pmatch("bc", "abcd")
g_mean <- grep("mean()",features[,2], fixed=T)
g_std <- grep("std()",features[,2], fixed=T)
g_mean_std <- c(g_mean , g_std)
col_names <- features[g_mean_std,2]
x_std_mean <- x_t[,g_mean_std]
y_activity <- merge(y_t, activity)[,2]
x_act_subj <- cbind(subj, y_activity, x_std_mean)
col_names <- c("Subject", "Activity", col_names)
names(x_act_subj) <- col_names
tapply(x_act_subj[,3], cbind(subj,y_activity), mean, simplyfy=F)
aggregate(names(x_act_subj)[[3]]~subj+activity, x_act_subj, mean)
res <- by(x_act_subj[,4:5], x_act_subj[1:2], mean)
x_act_subj_dt <- data.table(x_act_subj)
setnames(x_act_subj_dt,col_names)
avgDT <- x_act_subj_dt[, lapply(.SD,mean), by=c("Subject","Activity")]
avgDF <- data.frame(avgDT)
features[g_mean_std,2]
x_std_mean <- x_t[,g_mean_std]
y_activity <- merge(y_t, activity)[,2]
x_act_subj <- cbind(subj, y_activity, x_std_mean)
col_names <- c("Subject", "Activity", col_names)
names(x_act_subj) <- col_names
tapply(x_act_subj[,3], cbind(subj,y_activity), mean, simplyfy=F)
aggregate(names(x_act_subj)[[3]]~subj+activity, x_act_subj, mean)
res <- by(x_act_subj[,4:5], x_act_subj[1:2], mean)
x_act_subj_dt <- data.table(x_act_subj)
setnames(x_act_subj_dt,col_names)
avgDT <- x_act_subj_dt[, lapply(.SD,mean), by=c("Subject","Activity")]
avgDF <- data.frame(avgDT)