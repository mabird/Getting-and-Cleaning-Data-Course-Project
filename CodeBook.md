---
title: CodeBook for final assignment of the Coursera course Getting and Cleaning Data
output:
  pdf_document: default
  html_document: default
---


## Data source
Data (including the description of the data) for the assignment can be found here:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

Full description of the data: 

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>


## Data files
```
test_set <- read.table("test/X_test.txt")
test_labels <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")
training_set <- read.table("train/X_train.txt")
training_labels <- read.table("train/y_train.txt")
subject_training <- read.table("train/subject_train.txt")
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")
```


## Data cleanup (see run_analysis.R for details and code)
1. Name the columns according to the feature file
1. Select only columns with mean and standard deviation values
1. Add the columns with the subject number and the activity type and shift them to the beginning of the data frame
1. Join the test and training data sets
1. Change the numbers in the activity column to activity name
1. Clean-up the column names: remove "()" and change "-" to "_"
1. Create new data frame with average values for each subject/activity
1. Save the two tidy data frames as txt files: "full_data_means_sd.txt" and "data_average.txt"
