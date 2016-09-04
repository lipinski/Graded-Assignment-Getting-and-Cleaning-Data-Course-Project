library(dplyr)


# Loading feature names
feature_names <- read.csv("UCI HAR Dataset/features.txt", 
                          sep = "", header = FALSE, col.names = c("id", "name"))

# Loading activity labels
activity_labels <- read.csv("UCI HAR Dataset/activity_labels.txt", 
                            sep = "", header = FALSE, col.names = c("id", "name"))


# Loading train and test datasets with labels for each observation
train <- read.csv("UCI HAR Dataset/train/X_train.txt", 
                  sep = "", header = FALSE, col.names = feature_names[, "name"])

train$activity <- read.csv("UCI HAR Dataset/train/y_train.txt", 
                        sep = "", header = FALSE, col.names = c("activity"))[, "activity"]

train$subject <- read.csv('UCI HAR Dataset/train/subject_train.txt', 
                         sep = "", header = FALSE, col.names = c("subject"))[, "subject"]

test <- read.csv("UCI HAR Dataset/test/X_test.txt", 
                 sep = "", header = FALSE, col.names = feature_names[, "name"])

test$activity <- read.csv("UCI HAR Dataset/test/y_test.txt", 
                       sep = "", header = FALSE, col.names = c("activity"))[, "activity"]

test$subject <- read.csv('UCI HAR Dataset/test/subject_test.txt', 
                         sep = "", header = FALSE, col.names = c("subject"))[, "subject"]


# Merge train and test dataset
data <- rbind(train, test) %>% select(matches("mean|std|activity|subject"))


# Create factor variable label with label names
data$activity <- factor(data$activity, levels = 1:6, labels = activity_labels[, "name"])

# Calculate mean for each variable by activity and subject
avg_by_activitity_subject <- data %>% group_by(activity, subject) %>% summarise_each(funs(mean))

# Save new dataset to file
write.table(avg_by_activitity_subject, "avg_by_activity_and_subject.txt", row.name = FALSE)

