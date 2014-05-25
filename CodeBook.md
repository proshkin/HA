# Human Activity data cleanup

## Test data loaded from ./test folder

* X_test.txt file loaded. File is fixed width field file. File has 2947 rows and 561 columns and each column is 16 character wide.
* y_test.txt file loaded. File has 2947 rows and 1 numeric column with width 1.
* subject_test.txt file loaded. File has 2947 rows and 1 numeric column.

## Train data loaded from ./test folder

* X_train.txt file loaded. File is fixed width field file. File has 7352 rows and 561 columns and each column is 16 character wide.
* y_train.txt file loaded. File has 7352 rows and 1 numeric column with width 1.
* subject_train.txt file loaded. File has 7352 rows one numeric column.

## Bind test and train data

* row bind X test and train data. The result is 10299 rows.
* row bind Y test and train data. The result is 10299 rows.
* row bind subject data. The result is 10299 rows.

## Load other data sets

* Load features.txt file. File is space delimited file. File has 561 rows and 2 columns (Feature ID and Feature name)
* Load activity_label.txt. File is space delimited file. File has 6 rows and 2 columns. (Activity ID and Activity Name)

## Transformation

* Get only features that have "mean()" or "std()" in the name
* Join y and activity to substitute IDs with Activity names.
* Add subject and activity name columns to the data set
* Assigned descriptive column names 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. The resulting data set has 35 rows and 68 columns.
* Save data set to CSV file 
