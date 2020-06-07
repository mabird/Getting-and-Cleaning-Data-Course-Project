rm(list = ls())
library(tidyverse)

# Read in data --------------
test_set <- read.table("test/X_test.txt")
test_labels <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")
training_set <- read.table("train/X_train.txt")
training_labels <- read.table("train/y_train.txt")
subject_training <- read.table("train/subject_train.txt")
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")


# Name the columns according to the feature file-----------------
names(test_set) <- features$V2
names(training_set) <- features$V2


# Select only columns with mean and standard deviation values ----------
test_set <- test_set[, grep("mean|std", colnames(test_set))]
training_set <- training_set[, grep("mean|std", colnames(training_set))]

# Add the columns with the subject number and the activity type ----------
# and shift them to the beginning of the data frame 
test_set$activity <- test_labels$V1
test_set$subject <- subject_test$V1
test_set <- select(test_set, subject, activity, everything())
training_set$activity <- training_labels$V1
training_set$subject <- subject_training$V1
traing_set <- select(training_set, subject, activity, everything())


# Join the test and training data sets
full_data_means_sd <- rbind(test_set, training_set)


# Change the numbers in the activity column to activity name
labels <- vector("character", length = nrow(full_set))
for (i in 1:nrow(full_set)) {
    labels[i] <- as.character(activity_labels[activity_labels$V1 == full_set[i, "activity"], "V2"])
    full_set[i, "activity"] <- labels[i]
}
rm(labels)


# Clean-up the column names: remove "()" and change "-" to "_"
colnames(full_set) <- gsub("\\(\\)", "", colnames(full_set))
colnames(full_set) <- gsub("-", "_", colnames(full_set))


# create new data frame with average values for each subject/activity
data_average <- full_data_means_sd %>% 
    group_by(subject, activity) %>% 
    summarise_all(mean)


# save the two tidy data frames as txt files
write.table(full_data_means_sd, file = "full_data_means_sd.txt", 
            row.names = FALSE, col.names = TRUE)

write.table(data_average, file = "data_average.txt", 
            row.names = FALSE, col.names = TRUE)
